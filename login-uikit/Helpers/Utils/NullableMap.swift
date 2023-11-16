//
//  NullableMap.swift
//  login-uikit
//
//  Created by Taufiq Ichwanusofa on 16/11/23.
//

import Foundation

protocol NullableMap: Codable {
    init? (dict: [String: Any]?)
    func dictionary() -> [String: Any]?
}
