//
//  AttributedStringExtension.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/25/23.
//

import UIKit
// This extension is to common Attribued String and a clickable attributed string
// We have added this in a extension so that it can be directly used by any attributed string
extension NSAttributedString {
    static func makeAttributedString(text: String,
                                     fontSize: CGFloat,
                                     textColor: UIColor,
                                     underline: Bool = false) -> NSAttributedString {
            // Create attributes for the text (font, color, etc.)
            var attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: fontSize),
                .foregroundColor: textColor
            ]
            
            if underline {
                attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
            }

            // Create the attributed string
            let attributedString = NSAttributedString(string: text, attributes: attributes)

            return attributedString
        }
    
    static func makeClickableString(text: String,
                                    fontSize: CGFloat,
                                    textColor: UIColor,
                                    targetString: String,
                                    targetColor: UIColor) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize),
            .foregroundColor: textColor
        ]
        
        let attributedString = NSMutableAttributedString(string: text,
                                                         attributes: attributes)
        
        // Find the range of the target string
        let nsString = text as NSString
        let range = nsString.range(of: targetString)
        
        if range.location != NSNotFound {
            // Add a custom attribute to make it clickable
            // attributedString.addAttribute(.link, value: targetString, range: range)
            // Add color attribute to the target string
            attributedString.addAttribute(.foregroundColor, value: targetColor, range: range)
        }
        
        return attributedString
    }
}
