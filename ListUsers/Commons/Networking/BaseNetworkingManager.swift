//
//  BaseNetworkingManager.swift
//  Pods
//
//  Created by Igor Custodio on 01/03/23.
//

import Foundation
import Alamofire

open class BaseNetworkingManager<T: EndpointType> {

    private let networking: NetworkingProtocol
    private let config: NetworkingManagerConfig

    init(config: NetworkingManagerConfig = .init(), networking: NetworkingProtocol = Networking()) {
        self.networking = networking
        self.config = config
    }

    /// Use this method to make requests for any path
    ///
    /// - Parameters:
    ///   - path: the path of the request
    ///   - method: HTTP method
    ///   - headers: headers of the request
    ///   - parameters:  parameteres used in the request, can be in the body or in the query
    ///   - completion: escaping closure to handle the response
    func request<D: Decodable>(
        path: String,
        method: HTTPMethod,
        headers: HTTPHeaders?,
        parameters: Parameters?,
        completion: @escaping (Result<D, NetworkingErrorType>) -> Void
    ) {
        networking.request(
            path: path,
            method: method,
            headers: headers,
            parameters: parameters,
            completion: completion
        )
    }

    /// Use this method to make requests for paths based on AppSettings.baseUrl
    ///
    /// - Parameters:
    ///   - endpoint: EndpointType implementation with all parameters
    ///   - completion: escaping closure to handle the response
    func request<D: Decodable>(
        endpoint: T,
        completion: @escaping (Result<D, NetworkingErrorType>) -> Void
    ) {
        networking.request(
            path: endpoint.path,
            method: endpoint.method,
            headers: endpoint.headers,
            parameters: endpoint.body,
            completion: completion
        )
    }
}
