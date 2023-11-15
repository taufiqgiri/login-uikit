//
//  XIBView.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 15/11/23.
//

import UIKit
import SnapKit

class XIBView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        if let content = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            backgroundColor = content.backgroundColor
            addSubview(content)
            sendSubviewToBack(content)
            content.snp.makeConstraints { make in
                make.left.right.top.bottom.equalTo(self)
            }
        }
    }
}
