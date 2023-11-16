//
//  UILabel+Ext.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import UIKit

extension UILabel {
    func changeFontStyle(text: String, fontFamily: String, fontSize: Int, textColor: UIColor? = nil) {
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        let customFont = UIFont(name: fontFamily, size: CGFloat(fontSize)) ?? UIFont.systemFont(ofSize: 18)
        let range = ((self.text ?? "") as NSString).range(of: text)
        attributedString.addAttribute(.font, value: customFont, range: range)
        
        if let color = textColor {
            attributedString.addAttribute(.foregroundColor, value: textColor ?? UIColor.black, range: range)
        }
        
        self.attributedText = attributedString
    }
}
