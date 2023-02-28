//
//  HTTPMethod.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias HTTPBody = [String: Any]

public enum HTTPMethod: CustomStringConvertible {
    case get
    case post
    case put
    case patch
    case delete

    public var description: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .patch: return "PATCH"
        case .delete: return "DELETE"
        }
    }
}
