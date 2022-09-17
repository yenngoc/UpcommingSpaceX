//
//  Constant.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation

struct Constant {
    struct APIEndPoint {
        static var UpcomingSpaceX: String { return Config.baseUrl + "v4/launches/upcoming" }
    }
}
