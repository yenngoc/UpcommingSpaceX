//
//  APIConnector.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

func == <K, V>(left: [K:V], right: [K:V]) -> Bool {
    return NSDictionary(dictionary: left).isEqual(to: right)
}

public typealias APIConnectorCompletionBlock = (_ result: Any) -> Void
/** Block được gọi khi có lỗi */
public typealias APIConnectorFailureBlock = (_ error: Error?) -> Void

typealias Response = (Data?, Error?)

typealias JSONDictionary = [String: Any]

class APIService {
    func requestData<T:Decodable>(_ input: APIInput, completion completionBlock: ((T?, Error?)-> Void)? = nil) {
        let request = makeRequest(input: input)
            .validate()
       request.responseDecodable(of:T.self) { response in
           completionBlock?(response.value,nil)
        }
    }
    
    func requestArray<T: Decodable>(_ input: APIInput, completion completionBlock: (([T]?, Error?)-> Void)? = nil){
        let request = makeRequest(input: input)
            .validate()
       request.responseDecodable(of:[T].self) { response in
           completionBlock?(response.value,nil)
        }
        
    }
}

// MARK: - Support methods
extension APIService {
    
    private func makeRequest(input: APIInput) -> DataRequest {
    
        return AF.request(input.urlString, method: input.requestType, parameters: input.parameters, encoding: input.encoding, headers: HTTPHeaders(input.headers))
       
    }
    
    private func process(response: HTTPURLResponse, json: Any) throws -> JSONDictionary {
        if 200 ..< 300 ~= response.statusCode {
            if let json = json as? [String:Any] {
                print("👍 [\(response.statusCode)] " + (response.url?.absoluteString ?? ""))
                return json
            } else {
                 debugPrint("❌ Reponse is not valid [\(response.statusCode)] " + (response.url?.absoluteString ?? ""))
                throw APIError.invalidResponseData
            }
        } else if 400 ... 500 ~= response.statusCode {
            debugPrint("❌ [\(response.statusCode)] " + (response.url?.absoluteString ?? ""))
            if let json = json as? [String: Any],
                response.statusCode == 401 || response.statusCode == 404 {
                throw APIError.error(detail: ErrorDetail(json: json))
            } else {
                 throw APIError.unknown(statusCode: response.statusCode)
            }
        } else {
            throw APIError.invalidResponseData
        }
        
    }
    
    
    private func process(error: Error) throws -> [String: Any] {
        if case APIError.expiredToken = error {
            //Refresh Token and retry
        }
        if case APIError.invalidToken = error {
            //Force logout
        }
        throw error
    }
    
    func foo() throws {
        throw APIError.invalidResponseData
    }
    
    
    
    /*
    fileprivate func upload(_ input: UploadInputBase,
                            data: [UploadData]) -> Observable<JSONDictionary> {
        return preprocess(input)
            .do(onNext: { input in
                print(input)
            })
            Observable.just(input).flatMapLatest { input in
                Alamofire.SessionManager.default.rx
                    .upload(to: input.urlString,
                            method: input.requestType,
                            headers: input.headers) { (multipartFormData) in
                                if let params = input.parameters {
                                    for (key, value) in params {
                                        if let data = String(describing: value).data(using:.utf8) {
                                            multipartFormData.append(data, withName: key)
                                        }
                                    }
                                }
                                data.forEach({
                                    multipartFormData.append($0.data,
                                                             withName: $0.name,
                                                             fileName: $0.fileName,
                                                             mimeType: $0.mimeType)
                                })
                }
            }
            .do(onNext: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                }
            })
            .flatMapLatest { dataRequest -> Observable<(HTTPURLResponse, Data)> in
                return dataRequest
                    .rx.responseData()
            }
            .do(onNext: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }, onError: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            })
            .map { (dataResponse) -> JSONDictionary in
                return try self.process(dataResponse)
            }
            .catchError({ [weak self] (error) -> Observable<[String : Any]> in
                guard let _ = self else { return Observable.empty() }
//                if case API.APIError.expiredToken = error,
//                    let token = AuthManager.shared.token {
//                    var newToken = token
//                    newToken.expiryDate = Date().add(components: -1.day)
//                    AuthManager.shared.save(newToken)
//                    return this.upload(input, data: data)
//                }
                throw error
            })
    }
     */
    
//    fileprivate func preprocess(_ input: APIInput) -> APIInput {
//        return APIInput
//    }
}




// MARK: - Upload
/*
extension APIService {
    struct UploadData {
        let data: Data
        let name: String
        let fileName: String
        let mimeType: String
    }
    
    class UploadInputBase: APIInput {
        let data: [UploadData]
        
        init(data: [UploadData],
             urlString: String,
             parameters: [String: Any]?,
             requestType: HTTPMethod) {
            
            self.data = data
            
            super.init(urlString: urlString,
                       parameters: parameters,
                       requestType: requestType)
        }
    }
}
 */

