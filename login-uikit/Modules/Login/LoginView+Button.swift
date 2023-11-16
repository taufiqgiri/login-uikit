//
//  LoginView+Button.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Foundation

extension LoginView: CustomButtonDelegate {
    func didTapButton() {
        self.viewModel.postLogin(email: self.usernameTextfield.textfield.text ?? "", password: self.passwordTextfield.textfield.text ?? "")
    }
    
    
}
