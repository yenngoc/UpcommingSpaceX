//
//  DSLabel.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import UIKit

class IHLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateFont()
    }
    
    @IBInspectable var localizeString:String = "" {
        didSet {
            updateLocalize()
        }
    }
    
    private func updateLocalize() {
        self.text = self.localizeString.localized()
    }
    
    private func updateFont() {
//        let fontSize = self.font.pointSize
//        let fontName = self.font.fontName.lowercased()
//        switch fontName {
//        case let name where name.contains("bold"):
//            self.font = UIFont.appFont(ofSize: fontSize, weight: .bold)
//            break
//        case let name where name.contains("light"):
//            self.font = UIFont.appFont(ofSize: fontSize, weight: .light)
//        case let name where name.contains("black"):
//            self.font = UIFont.appFont(ofSize: fontSize, weight: .black)
//        case let name where name.contains("regular"):
//            self.font = UIFont.appFont(ofSize: fontSize, weight: .regular)
//        case let name where name.contains("medium"):
//            self.font = UIFont.appFont(ofSize: fontSize, weight: .medium)
//        default:
//            break
//        }
    }
}

