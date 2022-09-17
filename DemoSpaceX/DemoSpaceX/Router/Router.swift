//
//  Router.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation
import UIKit

enum RouterType {
    case root
    case push
    case present
}

// MARK: - Basic Router protocol
protocol Router {
    // Associatedtype for kind of router
    associatedtype Element: UIViewController
    
    // Type
    var routerType: RouterType {get}
    
    // View controller
    var viewController: Element {get}
    
    // Passing data between to router
    func handleData(_ block: (Element) -> Void)
}

// MARK: - Extend Router
extension Router {
    // Passing data
    func handleData(_ block: (Element) -> Void) {
        block(self.viewController)
    }
}


