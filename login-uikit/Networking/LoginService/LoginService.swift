//
//  LoginService.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Moya

class LoginService: LoginServiceProtocol, APIMappingProtocol {
    var provider = BaseProvider<LoginProvider>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    init(provider: BaseProvider<LoginProvider> = BaseProvider<LoginProvider>()) {
        self.provider = provider
    }
    
    func postLogin(email: String, password: String, onSuccess: ((LoginResponseModel) -> Void)?, onFailure: ((Error) -> Void)?) {
        provider.request(.postLogin(email: email, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.handleResult(result,
                              type: LoginResponseModel.self,
                              onSuccess: onSuccess,
                              onFailure: onFailure)
        }
    }
    
    
}
