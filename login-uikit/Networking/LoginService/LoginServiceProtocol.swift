//
//  LoginServiceProtocol.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Foundation

protocol LoginServiceProtocol {
    func postLogin(email: String, password: String, onSuccess: ((LoginResponseModel) -> Void)?, onFailure: ((Error) -> Void)?)
}
