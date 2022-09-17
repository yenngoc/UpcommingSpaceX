//
//  RouterManager.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation
import UIKit

class RouterManager {
    static let shared = RouterManager()
    init() {}
    
    var rootViewController: UIViewController? {
        let app = UIApplication.shared.delegate as! AppDelegate
        return app.window?.rootViewController
    }
    
    var visibleNavigationController: UINavigationController? {
        return self.visibleViewController?.navigationController
    }
    
    var visibleViewController: UIViewController? {
        guard let rootViewController = self.rootViewController else {return nil}
        if let presentedVC = rootViewController.presentedViewController {
            return presentedVC
        }
        if let navi = rootViewController as? UINavigationController {
            return navi.visibleViewController
        }
        return rootViewController
    }
    
    func handleRouter<A: Router>(_ router: A) {
        let viewController = router.viewController
        
        // Handle
        switch router.routerType {
        case .root:
            let app = UIApplication.shared.delegate as! AppDelegate
            app.window = UIWindow(frame: UIScreen.main.bounds)
            app.window?.rootViewController = viewController
            app.window?.makeKeyAndVisible()
            
        case .push:
            self.visibleNavigationController?.pushViewController(viewController, animated: true)
            
        case .present:
            self.visibleViewController?.present(viewController, animated: true, completion: nil)
        }
    }
}


