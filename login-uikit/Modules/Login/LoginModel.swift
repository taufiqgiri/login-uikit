//
//  LoginModel.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Foundation

struct LoginRequest: NullableMap {
    var email: String?
    var password: String?
    
    init(email: String? = nil, password: String? = nil) {
        self.email = email
        self.password = password
    }
    
    init?(dict: [String : Any]?) {
        guard let dict else { return }
        email = dict["email"] as? String
        password = dict["password"] as? String
    }
    
    func dictionary() -> [String: Any]? {
        var dict: [String: Any] = [:]
        dict["email"] = email
        dict["password"] = password
        
        return dict
    }
}

struct LoginResponseModel: NullableMap {
    var error: String?
    var token: String?

    init?(dict: [String : Any]?) {
        guard let dict = dict else {return nil}
        error           = dict["error"] as? String
        token           = dict["token"] as? String
    }
    
    func dictionary() -> [String : Any]? {
        var dict = [String: Any]()
        dict ["error"] = error
        dict ["token"] = token
        return dict
    }
}

