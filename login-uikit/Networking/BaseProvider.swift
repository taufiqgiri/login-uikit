//
//  BaseProvider.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Moya

class BaseProvider<T: TargetType>: MoyaProvider<T> {
    final class func endpointClosure (target: T) -> Endpoint {
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        return defaultEndpoint
    }
    
    override init(endpointClosure: @escaping MoyaProvider<T>.EndpointClosure = BaseProvider.endpointClosure,
                  requestClosure: @escaping MoyaProvider<T>.RequestClosure = MoyaProvider<T>.defaultRequestMapping,
                  stubClosure: @escaping MoyaProvider<T>.StubClosure = MoyaProvider.neverStub,
                  callbackQueue: DispatchQueue? = nil,
                  session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                  plugins: [PluginType] = [],
                  trackInflights: Bool = false) {
        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure,
                   callbackQueue: callbackQueue, session: session, plugins: plugins, trackInflights: trackInflights)
    }
}
