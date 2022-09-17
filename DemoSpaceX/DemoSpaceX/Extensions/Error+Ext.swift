//
//  Error+Ext.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation
import Alamofire

extension Error {
    
    var code : Int {
        return (self as NSError).code
    }
    
    var domain: String {
        return (self as NSError).domain
    }
    
    var reason: String? {
        return (self as NSError).reason
    }
    
    var isNoInternetConnectionError: Bool {
        return (domain == NSURLErrorDomain && (code == NSURLErrorNotConnectedToInternet || code == NSURLErrorNetworkConnectionLost || code == NSURLErrorCannotConnectToHost))
    }
    
    var isSSLError: Bool {
        return domain == NSURLErrorDomain && code == NSURLErrorServerCertificateUntrusted
    }
    
    var isRequestTimeOutError: Bool {
        return code == NSURLErrorTimedOut
    }
    
    var isJSONSerializeError: Bool {
        if let error = self as? AFError { return error.isResponseValidationError || error.isResponseSerializationError }
        return code == 3840 && domain == NSCocoaErrorDomain
    }
    
    var isCancelled: Bool {
        return code == -999 && domain == NSURLErrorDomain
    }
    
}

extension NSError {
    
    var isNoInternetConnectionError : Bool {
        return (domain == NSURLErrorDomain && (code == NSURLErrorNotConnectedToInternet || code == NSURLErrorNetworkConnectionLost || code == NSURLErrorCannotConnectToHost))
    }
    
    var isSSLError: Bool {
        return domain == NSURLErrorDomain && code == NSURLErrorServerCertificateUntrusted
    }
    
    var isRequestTimeOutError : Bool {
        return code == NSURLErrorTimedOut
    }
    
    var isJSONSerializeError: Bool {
        return code == 3840 && domain == NSCocoaErrorDomain
    }
    
    var isCancelled: Bool {
        return code == -999 && domain == NSURLErrorDomain
    }
    
    var reason: String? {
        return userInfo[NSLocalizedFailureReasonErrorKey] as? String
    }
    
}

extension HTTPURLResponse {
    
    func isServerNotFound() -> Bool {
        return self.statusCode == 404
    }
    
    func isInternalError() -> Bool {
        return self.statusCode == 500
    }
    
}

