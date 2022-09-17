//
//  AppUserDefault.swift
//  DemoSpaceX
//
//  Created by Y on 16/09/2022.
//

import Foundation

let APP_GROUP = "demo.SpaceX"
let BUNDLE_ID = Bundle.main.bundleIdentifier ?? "com.hms.HotelOwner"

public class SUserDefaults: UserDefaults {
    /// Singleton instance
    static public let shared = SUserDefaults()
    
    private init() {
        super.init(suiteName: APP_GROUP)!
    }
    
}

extension UserDefaults {
    
    enum Keys {
        
        static let spaceX = makeNormalKey(suffix: "spaceX")
        
        // MARK: - Helper

        static func makeNormalKey(suffix: String) -> String {
            return "\(BUNDLE_ID).\(suffix)"
        }
        
    }
}

