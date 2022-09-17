//
//  AppData.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation

class AppData {
    private init() {}
    static let shared = AppData()
    var movieGenre: [Int: String] = [:]
}

