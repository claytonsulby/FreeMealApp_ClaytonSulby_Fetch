//
//  Agent.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/30/21.
//

import Foundation
import Combine

@available(iOS 13.0, macOS 10.15, *)
struct Agent {
    
    struct Response<T> {
        internal init(value: T, response: URLResponse) {
            self.value = value
            self.response = response
        }
        
        let value: T
        let response: URLResponse
    }
    
    enum ServiceErrors: Error {
        case internalError(_ statusCode: Int)
        case serverError(_ statusCode: Int)
    }
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) throws -> Response<T> in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400:
                    // Bad Request
                    throw NetworkError.badRequest
                case 401:
                    // Unauthorized
                    throw NetworkError.unauthorized
                case 403:
                    // Forbidden
                    throw NetworkError.forbidden
                case 404:
                    // Not Found
                    throw NetworkError.notFound
                case 405:
                    // Method Not Allowed
                    throw NetworkError.methodNotAllowed
                case 406:
                    // Not Acceptable
                    throw NetworkError.notAcceptable
                case 408:
                    // Request Timeout
                    throw NetworkError.requestTimeout
                case 410:
                    throw NetworkError.gone
                case 422:
                    // Unprocessable Entity
                    throw NetworkError.unprocessableEntity
                case 429:
                    // Too Many Requests
                    throw NetworkError.tooManyRequests
                case 500...599:
                    // Server error
                    throw NetworkError.serverError(httpResponse.statusCode)
                default:
                    // Other status codes
                    throw URLError(URLError.Code(rawValue: (response as! HTTPURLResponse).statusCode))
                }
                
                do {
                    
                    // Check for a specific error response
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let success = jsonObject["success"] as? Bool,
                        !success {
                        throw DecodeError.invalidResponse(rawData: data)
                    }
                    
                    let value = try decoder.decode(T.self, from: data)
                    return Response(value: value, response: response)
                } catch let error as DecodingError {
                    switch error {
                    case DecodingError.dataCorrupted(let context):
                        throw DecodeError.dataCorrupted(context: context, rawData: data)
                    case DecodingError.keyNotFound(let key, let context):
                        throw DecodeError.keyNotFound(key: key, context: context, rawData: data)
                    case DecodingError.valueNotFound(let value, let context):
                        throw DecodeError.valueNotFound(value: value, context: context, rawData: data)
                    case DecodingError.typeMismatch(let type, let context):
                        throw DecodeError.typeMismatch(type: type, context: context, rawData: data)
                    default:
                        throw error
                    }
                } catch let error as URLError {
                    throw error
                } catch {
                    throw error
                }
            }
            .retryWhen({ error in
                if let networkError = error as? NetworkError {
                    switch networkError {
                    case .requestTimeout, .serverError, .tooManyRequests:
                        return true
                    default:
                        return false
                    }
                }
                return false // Don't retry for other errors
            }, maxRetries: 3)
            .eraseToAnyPublisher()
    }
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder(), completion: @escaping (T) -> Void) {
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data else {
                print("invalid response")
                return
            }
            
            do {
                completion(try decoder.decode(T.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) async throws -> Response<T> {
        let (data, response) = try await URLSession.shared.data(for: request)
        let value = try decoder.decode(T.self, from: data)
        return Response(value: value, response: response)
    }
    
}

extension Agent {
    
}

extension Publisher {
    func retryWhen(_ shouldRetry: @escaping (Failure) -> Bool, maxRetries: Int) -> AnyPublisher<Output, Failure> {
        var retries = 0
        return self
            .flatMapError { error -> AnyPublisher<Output, Failure> in
                if shouldRetry(error) && retries < maxRetries {
                    retries += 1
                    return self.retryWhen(shouldRetry, maxRetries: maxRetries)
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

extension Publisher {
    func flatMapError<E: Error>(_ transform: @escaping (Failure) -> AnyPublisher<Output, E>) -> AnyPublisher<Output, E> {
        return self
            .catch { error -> AnyPublisher<Output, E> in
                transform(error)
            }
            .eraseToAnyPublisher()
    }
}
