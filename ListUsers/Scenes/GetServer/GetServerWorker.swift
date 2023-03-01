//
//  GetServerWorker.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation
import Alamofire

protocol GetServerWorkerProtocol: AnyObject {
    func getUsers(for path: String, completion: @escaping (Result<[UserDataModel], AFError>) -> Void)
}

final class GetServerWorker: GetServerWorkerProtocol {
    func getUsers(for path: String, completion: @escaping (Result<[UserDataModel], AFError>) -> Void) {
        UserNetworkingManager().getUserList(
            path: UserEndpoint.getUsers(customPath: path).path) { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
    }
}

enum UserEndpoint: EndpointType {
    case getUsers(customPath: String)

    var path: String {
        switch self {
        case let .getUsers(customPath):
            return "\(customPath)/api/v1/user"
        }
    }
    var method: HTTPMethod {
        .get
    }

    var headers: HTTPHeaders? { nil }

    var body: Parameters? { nil }
}
