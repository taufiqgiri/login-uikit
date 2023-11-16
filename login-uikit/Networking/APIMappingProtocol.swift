//
//  APIMappingProtocol.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Moya

protocol APIMappingProtocol {
    
}

extension APIMappingProtocol {
    private func mapResponse<T: NullableMap>(_ response: Moya.Response,
                                             type: T.Type,
                                             onSuccess: ((T) -> Void)?,
                                             onFailure: ((Error) -> Void)? ) {
        DispatchQueue(label: "map_queue").async {
            do {
                let obj = try response.mapJSON()
                guard let obj = obj as? [String: Any], let response = T(dict: obj)  else {
                    DispatchQueue.main.async { onFailure?(CommonError.mappingError) }
                    return
                }
                
                DispatchQueue.main.async { onSuccess?(response) }
            } catch {
                DispatchQueue.main.async { onFailure?(error) }
            }
        }
    }
    
    func handleResult<T: NullableMap>(_ result: Result<Moya.Response, MoyaError>,
                                       type: T.Type,
                                       onSuccess: ((T) -> Void)?,
                                       onFailure: ((Error) -> Void)?
    ) {
        switch result {
        case .success(let response):
            self.mapResponse(response, type: type, onSuccess: onSuccess, onFailure: onFailure)
            
        case .failure(let error):
            onFailure?(error)
        }
    }
}

enum CommonError: Error {
    case mappingError
    
    var message: String {
        switch self {
        case .mappingError:
            return "No data or errors successfully mapped!"
        }
    }
}
