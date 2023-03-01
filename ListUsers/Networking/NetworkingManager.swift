//
//  NetworkingManager.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import Foundation
import Alamofire

final class UserNetworkingManager: BaseNetworkingManager<UserEndpoint> {
    func getUserList(path: String, completion: @escaping (Result<[UserDataModel], AFError>) -> Void) {
        request(endpoint: .getUsers(customPath: path), completion: completion)
    }
}
