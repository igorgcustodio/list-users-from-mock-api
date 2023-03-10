//
//  GetServerWorker.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation
import Alamofire

protocol GetServerWorkerProtocol: AnyObject {
    func getUsers(for path: String, completion: @escaping (Result<[UserDataModel], NetworkingErrorType>) -> Void)
}

final class GetServerWorker: GetServerWorkerProtocol {
    func getUsers(for path: String, completion: @escaping (Result<[UserDataModel], NetworkingErrorType>) -> Void) {
        UsersNetworkingManager().getUserList(
            path: path
        ) { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
    }
}

