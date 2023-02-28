//
//  GetServerViewModel.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit

protocol GetServerViewModelProtocol: AnyObject {
    func getUserList(for url: String?)
}

final class GetServerViewModel {

    // MARK: - Properties

    private let coordinator: CoordinatorCommonDelegate
    private let worker: GetServerWorkerProtocol

    // MARK: - Init

    init(worker: GetServerWorkerProtocol = GetServerWorker(), coordinator: CoordinatorCommonDelegate) {
        self.worker = worker
        self.coordinator = coordinator
    }
}

extension GetServerViewModel: GetServerViewModelProtocol {
    func getUserList(for url: String?) {
        if let url {
            worker.getUsers(for: url) { [weak self] result in
                print(result)
            }
        }
    }
}


// MARK: - UserElement

struct User: Decodable {
    let createdAt: String?
    let name: String?
    let avatar: String?
    let username: String?
    let knownIPS: [String]?
    let profile: Profile?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case createdAt
        case name
        case avatar
        case username
        case knownIPS
        case profile
        case id
    }
}

// MARK: - Profile
struct Profile: Decodable {
    let firstName: String?
    let lastName: String?
    let staticData: [Int]?

    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case staticData
    }
}

