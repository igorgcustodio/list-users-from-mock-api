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

protocol GetServerViewModelCoordinatorDelegate: CoordinatorCommonDelegate {
    func openUsersList(users: [UserDataModel])
}

final class GetServerViewModel {

    // MARK: - Properties

    private let coordinator: GetServerViewModelCoordinatorDelegate
    private let worker: GetServerWorkerProtocol

    // MARK: - Init

    init(worker: GetServerWorkerProtocol = GetServerWorker(), coordinator: GetServerViewModelCoordinatorDelegate) {
        self.worker = worker
        self.coordinator = coordinator
    }
}

extension GetServerViewModel: GetServerViewModelProtocol {
    func getUserList(for url: String?) {
        if let url {
            worker.getUsers(for: url) { [weak self] result in
                guard let self else { return }
                switch result {
                case let .success(users):
                    // TODO: Convert to set to remove duplicates
                    self.coordinator.openUsersList(users: users)
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}

