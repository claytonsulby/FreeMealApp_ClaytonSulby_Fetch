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
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) async throws -> Response<T> {
        let (data, response) = try await URLSession.shared.data(for: request)
        try handleNetworkError(response: response)
        let value:T = try handleDecodeError(data: data, decoder: decoder)
        return Response(value: value, response: response)
    }
    
}

//MARK: Error Handling
extension Agent {
    
    private func handleNetworkError(response:URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            break
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 403:
            throw NetworkError.forbidden
        case 404:
            throw NetworkError.notFound
        case 405:
            throw NetworkError.methodNotAllowed
        case 406:
            throw NetworkError.notAcceptable
        case 408:
            throw NetworkError.requestTimeout
        case 410:
            throw NetworkError.gone
        case 422:
            throw NetworkError.unprocessableEntity
        case 429:
            throw NetworkError.tooManyRequests
        case 500...599:
            throw NetworkError.serverError(httpResponse.statusCode)
        default:
            // Other status codes
            throw URLError(URLError.Code(rawValue: (response as! HTTPURLResponse).statusCode))
        }
    }
    
    private func handleDecodeError<T: Decodable>(data:Data, decoder:JSONDecoder) throws -> T {
        do {
            // Check for a specific error response
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let success = jsonObject["success"] as? Bool,
                !success {
                throw DecodeError.invalidResponse(rawData: data)
            }
            return try decoder.decode(T.self, from: data)
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
    
}
