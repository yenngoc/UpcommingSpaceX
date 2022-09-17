//
//  APIInput.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation
import Alamofire

class APIInput {
    
    var headers: [String: String] = [:]
    let urlString: String
    let requestType: HTTPMethod
    let encoding: ParameterEncoding
    var parameters: [String: Any] = [:]
    var accessToken: String?
    
    init(urlString: String,
         parameters: [String: Any]? = nil,
         requestType: HTTPMethod,
         isApiKey: Bool? = nil,
         isSetLanguage: Bool? = nil) {
        self.urlString = urlString
        self.parameters = parameters ?? [:]
        self.requestType = requestType
        self.encoding = requestType == .get ? URLEncoding.default : JSONEncoding.default
        
        
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        self.headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json",
            "App-Version": appVersion
        ]
        
    }
}



extension APIInput: CustomStringConvertible {
    var urlEncodingString: String {
        guard
            let url = URL(string: urlString),
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
            requestType == .get
            else {
                return urlString
        }
        urlComponents.queryItems = parameters.map {
            return URLQueryItem(name: "\($0)", value: "\($1)")
        }
        return urlComponents.url?.absoluteString ?? urlString
    }
    
    var description: String {
        if requestType == .get {
            return [
                "🌎 \(requestType.rawValue) \(urlEncodingString)"
                ].joined(separator: "\n")
        }
        return [
            "🌎 \(requestType.rawValue) \(urlString) \(headers.values)",
            "Parameters: \(String(describing: parameters ?? JSONDictionary()))"
            ].joined(separator: "\n")
    }
}
