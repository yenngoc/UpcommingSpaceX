//
//  BaseViewController.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    @objc func onCloseTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onBackTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        
    }
}
