//
//  Font+Ext.swift
//  DemoSpaceX
//
//  Created by Y on 16/09/2022.
//

import Foundation
import UIKit

extension UIFont {
    
    class func appFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        var fontName = "Poppins"
        
        switch weight {
            case .ultraLight: fontName += "-LightItalic"
            case .thin: fontName += "-Thin"
            case .light: fontName += "-Light"
            case .regular: fontName += "-Regular"
            case .medium: fontName += "-Medium"
            case .semibold: fontName += "-SemiBold"
            case .bold: fontName += "-Bold"
            case .heavy: fontName += "-ExtraBold"
            case .black: fontName += "-Black"
            default: fontName += "-Regular"
        }
        
        return UIFont(name: fontName, size: size) ?? .systemFont(ofSize: size, weight: weight)
    }
    
}

