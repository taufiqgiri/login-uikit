//
//  LoginViewModel.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func didSuccessLogin()
    func didFailLogin(error: String)
}

class LoginViewModel {
    private let service: LoginServiceProtocol
    weak var delegate: LoginViewModelDelegate?
    
    init(service: LoginServiceProtocol = LoginService()) {
        self.service = service
    }
    
    func postLogin(email: String, password: String) {
        self.service.postLogin(email: email, password: password, onSuccess: { [weak self] result in
            guard let self else { return }
            if let response = result.token {
                self.delegate?.didSuccessLogin()
            } else {
                self.delegate?.didFailLogin(error: result.error ?? "")
            }
        }, onFailure: { error in
            self.delegate?.didFailLogin(error: error.localizedDescription)
        })
    }
}
