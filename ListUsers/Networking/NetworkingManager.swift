//
//  NetworkingManager.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import Foundation
import Alamofire

open class BaseNetworkingManager<T: EndpointType> {

    let networking: NetworkingProtocol

    init(networking: NetworkingProtocol = Networking()) {
        self.networking = networking
    }

    func request<D: Decodable>(
        path: String,
        method: Alamofire.HTTPMethod,
        headers: Alamofire.HTTPHeaders?,
        parameters: Parameters?,
        type: D.Type,
        completion: @escaping (Result<D, AFError>) -> Void
    ) {
        networking.request(
            path: path,
            method: method,
            headers: headers,
            parameters: parameters,
            type: type,
            completion: completion
        )
    }

    // TODO: Create
//    func request<D: Decodable>(
//        endpoint: T,
//        type: D.Type,
//        completion: @escaping (Result<D, AFError>) -> Void
//    ) {
//        networking.request(
//            path: endpoint.path,
//            method: endpoint.method,
//            headers: [:],
//            parameters: endpoint.body,
//            type: type,
//            completion: completion
//        )
//    }
}


final class UserNetworkingManager: BaseNetworkingManager<UserEndpoint> {
    func getUserList(path: String, completion: @escaping (Result<[UserDataModel], AFError>) -> Void) {
        request(
            path: path,
            method: .get,
            headers: nil,
            parameters: nil,
            type: [UserDataModel].self,
            completion: completion
        )
    }
}
