//
//  HTTPResponse.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation


public struct HTTPResponse<T: Decodable> {
    public let value: T
    public let headers: [String: Any]
    public let type: ResponseType

    public enum ResponseType {
        /// Data from `API`
        case api
        /// Data from `cache`
        case cache
        /// Data from `mock`
        case mock
    }
}
