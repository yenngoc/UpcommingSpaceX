//
//  SpaceXRouter.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation

class SpaceXRouter: Router {
    
    typealias Element = UpComingSpaceXController
    
    var routerType: RouterType {
        return .root
    }
    
    fileprivate lazy var _viewController: BaseViewController = {
        return UpComingSpaceXController()
    }()
    
    var viewController: UpComingSpaceXController {
        return _viewController as! UpComingSpaceXController
    }
}
