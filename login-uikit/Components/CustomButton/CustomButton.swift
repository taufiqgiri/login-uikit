//
//  CustomButton.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import UIKit

protocol CustomButtonDelegate: AnyObject {
    func didTapButton()
}

class CustomButton: XIBView {
    @IBOutlet weak var buttonTitle: UILabel!
    @IBOutlet weak var buttonIcon: UIImageView!
    @IBOutlet weak var buttonView: UIView!
    
    weak var delegate: CustomButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupAction()
    }

}

extension CustomButton {
    func setupView(title: String, isHideIcon: Bool = false) {
        self.buttonIcon.isHidden = isHideIcon
        self.buttonTitle.text = title
        self.buttonView.layer.cornerRadius = 8
        self.buttonView.dropShadow(opacity: 1)
    }
    
    private func setupAction() {
        let buttonTapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapButton))
        self.buttonView.isUserInteractionEnabled = true
        self.buttonView.addGestureRecognizer(buttonTapGesture)
    }
    
    @objc func onTapButton() {
        self.delegate?.didTapButton()
    }
}
