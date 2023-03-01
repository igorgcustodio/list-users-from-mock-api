//
//  GetServerWorker.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation

protocol GetServerWorkerProtocol: AnyObject {
    func getUsers(for path: String, completion: @escaping (Result<[UserDataModel], ErrorType>) -> Void)
}

final class GetServerWorker: GetServerWorkerProtocol {
    func getUsers(for path: String, completion: @escaping (Result<[UserDataModel], ErrorType>) -> Void) {
        NetworkRouter(session: .shared).performRequest(for: UserEndpoint.getUsers(customPath: path), decodingType: [UserDataModel].self) { result in
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
    var body: HTTPBody? { nil }
}
