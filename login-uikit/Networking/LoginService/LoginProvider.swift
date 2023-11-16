//
//  LoginProvider.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Moya

enum LoginProvider {
    case postLogin(email: String, password: String)
}

extension LoginProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://reqres.in")!
    }
    
    var path: String {
        switch self {
        case .postLogin:
            return "/api/login"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        switch self {
        case .postLogin(let email, let password):
            let param = [
                "email": email,
                "password": password
            ]
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postLogin:
            return ["Content-Type": "application/json",
                    "Accept": "application/json"]
        }
    }
}
