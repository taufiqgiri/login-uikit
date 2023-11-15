//
//  CustomTextField.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 15/11/23.
//

import UIKit

class CustomTextField: XIBView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var forgotLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var eyeButton: UIImageView!
    @IBOutlet weak var textfieldContainer: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension CustomTextField {
    func setupView(label: String, placeholder: String = "", isHideForgotLabel: Bool = false, isHideEyeButton: Bool = false) {
        self.forgotLabel.isHidden = isHideForgotLabel
        self.eyeButton.isHidden = isHideEyeButton
        
        self.titleLabel.text = label
        self.textfield.borderStyle = .none
        self.textfield.placeholder = placeholder
        
        self.textfieldContainer.dropShadow()
        self.textfieldContainer.layer.cornerRadius = 8
    }
}
