//
//  UIDevice+Extension.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation

extension Dictionary {
    func parseAPIError() throws -> ResponseError? {
        do {
           let data = try JSONSerialization.data(withJSONObject: self,     options: .prettyPrinted)
            return try JSONDecoder().decode(ResponseError.self, from: data)
        } catch let error {
            throw error
        }
    }
    
    func covertToData() throws -> Data {
        do {
            let data = try JSONSerialization.data(withJSONObject: self,     options: .prettyPrinted)
            return data
        } catch let error {
            throw error
        }
    }
}
