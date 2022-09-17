//
//  APIError.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation

extension APIService {
    
    enum APIError: Error, CustomStringConvertible, LocalizedError {
        case noStatusCode
        case invalidResponseData
        case unknown(statusCode: Int)
        case error(detail: ErrorDetail)
        case invalidToken
        case expiredToken
        case customError(localizeDescription: String)
        case serverError
        
        var description: String {
            switch self {
            case let .unknown(code):
                return "Unknow error" + " \(code)"
            case .invalidResponseData:
                return "Invalid response data"
            case let .error(detail):
                return detail.message ?? ""
            case .invalidToken:
                return "Invalid access token"
            case let .customError(localizeDescription):
                return localizeDescription
            case .serverError:
                return "Something went wrong"
            default:
                return "Unknow error"
            }
        }
        
        var code: Int {
            switch self {
            case let .error(response):
                return response.statusCode ?? 0
            case let .unknown(code):
                return code
            default:
                return 0
            }
        }
        
        var errorDescription: String? {
            return description
        }
    }
}

class ResponseError: Decodable {
    var errors: [ErrorDetail]?
}

class ErrorDetail: Decodable {
    var statusCode: Int?
    var message: String?
    var success: Bool?
    
    init(json: [String: Any]) {
        statusCode = json["status_code"] as? Int
        message = json["status_message"] as? String
        success = json["success"] as? Bool
    }
}



