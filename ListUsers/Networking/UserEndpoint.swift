//
//  UserEndpoint.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import Foundation
import Alamofire

enum UserEndpoint: EndpointType {
    case getUsers(customPath: String)

    var path: String {
        switch self {
        case let .getUsers(customPath):
            return "\(customPath)/api/v1/useer"
        }
    }
    var method: HTTPMethod {
        .get
    }

    var headers: HTTPHeaders? { nil }

    var body: Parameters? { nil }
}
