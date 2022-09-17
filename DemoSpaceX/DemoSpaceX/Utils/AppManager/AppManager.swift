//
//  AppManager.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation

class AppManager {
    static let shared = AppManager()
    private init() {}
    
    func initSDK() {
        //Init all SDK in app. Ex: Firebase, Fabric...
    }
    

    func setupRootView() {
        let route = SpaceXRouter()
        RouterManager.shared.handleRouter(route)
    }
}
