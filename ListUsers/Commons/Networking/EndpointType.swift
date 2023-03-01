//
//  EndpointType.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation
import Alamofire

public protocol EndpointType {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var body: Parameters? { get }
    var timeout: TimeInterval { get }
    var url: URL? { get }
}

extension EndpointType {
    public var timeout: TimeInterval { 60.0 }
    public var url: URL? { URL(string: path) }
}
