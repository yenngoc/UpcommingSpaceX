//
//  UpcomingSpaceXInput.swift
//  DemoSpaceX
//
//  Created by Y on 11/09/2022.
//

import Foundation
import UIKit

class UpcomingSpaceXInput {
    final class GetUpcomingSpaceXInput: APIInput {
        init() {
            super.init(urlString: Constant.APIEndPoint.UpcomingSpaceX,
                      parameters: nil,
                      requestType: .get, isSetLanguage: false)
        }
    }
}
