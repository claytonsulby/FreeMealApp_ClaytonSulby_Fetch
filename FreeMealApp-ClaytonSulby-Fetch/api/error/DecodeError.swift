//
//  File.swift
//
//
//  Created by Clayton Sulby on 3/10/24.
//

import Foundation

enum DecodeError: Error {
    case dataCorrupted(context: DecodingError.Context, rawData: Data?)
    case keyNotFound(key: CodingKey, context: DecodingError.Context, rawData: Data?)
    case valueNotFound(value: Any, context: DecodingError.Context, rawData: Data?)
    case typeMismatch(type: Any.Type, context: DecodingError.Context, rawData: Data?)
    case invalidResponse(rawData: Data?)
}

extension DecodeError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString(self.description, comment: "")
    }
}

extension DecodeError: CustomStringConvertible {
    var description: String {
        switch self {
        case .dataCorrupted(let context, let rawData):
            let contextString = "\(context)"
            let rawDataString = rawData.flatMap { String(data: $0, encoding: .utf8) } ?? ""
            return "Data corrupted: \(contextString)\nRaw data: \(rawDataString)"
        case .keyNotFound(let key, let context, let rawData):
            let contextString = "\(context)"
            let rawDataString = rawData.flatMap { String(data: $0, encoding: .utf8) } ?? ""
            return "Key not found: \(key.stringValue), \(contextString)\nRaw data: \(rawDataString)"
        case .valueNotFound(let value, let context, let rawData):
            let contextString = "\(context)"
            let rawDataString = rawData.flatMap { String(data: $0, encoding: .utf8) } ?? ""
            return "Value not found: \(value), \(contextString)\nRaw data: \(rawDataString)"
        case .typeMismatch(let type, let context, let rawData):
            let contextString = "\(context)"
            let rawDataString = rawData.flatMap { String(data: $0, encoding: .utf8) } ?? ""
            return "Type mismatch: \(type), \(contextString)\nRaw data: \(rawDataString)"
        case .invalidResponse(let rawData):
            let rawDataString = rawData.flatMap { String(data: $0, encoding: .utf8) } ?? ""
            return "Invalid response: \(rawDataString)"
        }
    }
}
