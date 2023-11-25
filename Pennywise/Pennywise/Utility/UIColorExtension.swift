//
//  UIColorExtension.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/25/23.
//

import UIKit
// This is the extension for UIKit UIColor, here we can define custom color palette and it has a custom func do send Hex Color Codes
extension UIColor {
    public class var blackHigh: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
    }
    
    public class var blackMedium: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.60)
    }
    
    public class var blackLow: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.30)
    }

    public class var grayLight4: UIColor {
        return UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
    }
    
    public class var redDark: UIColor {
        return UIColor(red: 0.93, green: 0.13, blue: 0.23, alpha: 1)
    }
    
    // Custom color with hex value
    public class func customColor(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
