//
//  File.swift
//
//
//  Created by Clayton Sulby on 3/10/24.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible, LocalizedError {
    // Common errors
    case invalidResponse
    case requestFailed(reason: String)
    
    // Client errors
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case requestTimeout
    case unprocessableEntity
    case tooManyRequests
    case gone
    
    // Server errors
    case serverError(_ statusCode: Int)
    
    // Unknown error
    case unknown
    
    // Custom description for each error
    var description: String {
        switch self {
        case .invalidResponse:
            return NSLocalizedString("Invalid response from the server", comment: "")
        case .requestFailed(let reason):
            return NSLocalizedString("Request failed: \(reason)", comment: "")
        case .badRequest:
            return NSLocalizedString("Bad request", comment: "")
        case .unauthorized:
            return NSLocalizedString("Unauthorized", comment: "")
        case .forbidden:
            return NSLocalizedString("Forbidden", comment: "")
        case .notFound:
            return NSLocalizedString("Resource not found", comment: "")
        case .methodNotAllowed:
            return NSLocalizedString("Method not allowed", comment: "")
        case .notAcceptable:
            return NSLocalizedString("Not acceptable", comment: "")
        case .requestTimeout:
            return NSLocalizedString("Request timeout", comment: "")
        case .unprocessableEntity:
            return NSLocalizedString("Unprocessable entity", comment: "")
        case .tooManyRequests:
            return NSLocalizedString("Too many requests", comment: "")
        case .gone:
            return NSLocalizedString("Resource gone", comment: "") // Custom description for 410 Gone
        case .serverError(let statusCode):
            return NSLocalizedString("Server error: \(statusCode)", comment: "")
        case .unknown:
            return NSLocalizedString("Unknown error occurred", comment: "")
        }
    }
    
    // Localized error description
    var errorDescription: String? {
        return description
    }
}
