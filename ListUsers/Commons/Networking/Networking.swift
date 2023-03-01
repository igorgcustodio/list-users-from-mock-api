//
//  Networking.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation
import Alamofire

protocol NetworkingProtocol: AnyObject {
    func request<T: Decodable>(
        path: String,
        method: HTTPMethod,
        headers: HTTPHeaders?,
        parameters: Parameters?,
        type: T.Type,
        completion: @escaping (Result<T, AFError>
        ) -> Void)
}

final class Networking: NetworkingProtocol {

    func request<T: Decodable>(
        path: String,
        method: HTTPMethod = .get,
        headers: HTTPHeaders? = nil,
        parameters: Parameters? = nil,
        type: T.Type,
        completion: @escaping (Result<T, AFError>
        ) -> Void) {
        let utilityQueue = DispatchQueue.global(qos: .utility)
        AF.request(
            path,
            method: method,
            parameters: parameters,
            headers: headers
        )
            .responseDecodable(
                of: type,
                queue: utilityQueue
            ) { response in
                switch response.result {
                case let .success(data):
                    completion(.success(data))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
}
