//
//  UIViewController+Ẽt.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import UIKit

extension UIViewController {
    static func instantiateFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib(self)
    }
    
    func addFadedAnimtion() {
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
    }
}


