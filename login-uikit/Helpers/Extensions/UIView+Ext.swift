//
//  UIView+Ext.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import UIKit

extension UIView {
    func dropShadow(scale: Bool = true, opacity: Float = 0.16) {
        layer.masksToBounds = false
        layer.shadowColor = CustomColors.color_bebebe.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 0, height: 16)
        layer.shadowRadius = 24
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
