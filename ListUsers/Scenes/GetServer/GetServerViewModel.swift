//
//  GetServerViewModel.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit

protocol GetServerViewModelProtocol: AnyObject {
    func getUserList(for url: String?)
    func observeStates(_ completion: @escaping (DefaultState) -> Void)
}

protocol GetServerViewModelCoordinatorDelegate: CoordinatorCommonDelegate {
    func openUsersList(users: [UserDataModel])
}

final class GetServerViewModel {

    // MARK: - Properties

    private let coordinator: GetServerViewModelCoordinatorDelegate
    private let worker: GetServerWorkerProtocol
    private let state: Observable<DefaultState>

    // MARK: - Init

    init(worker: GetServerWorkerProtocol = GetServerWorker(), coordinator: GetServerViewModelCoordinatorDelegate) {
        self.worker = worker
        self.coordinator = coordinator
        self.state = .init(.normal)
    }
}

extension GetServerViewModel: GetServerViewModelProtocol {
    func getUserList(for url: String?) {
        if let url {
            state.notify(.loading)
            worker.getUsers(for: url) { [weak self] result in
                guard let self else { return }
                switch result {
                case let .success(users):
                    let setUsers = Set(users)
                    self.coordinator.openUsersList(users: Array(setUsers))
                    self.state.notify(.success)
                case let .failure(error):
                    self.state.notify(.failure(error: error))
                }
            }
        }
    }

    func observeStates(_ completion: @escaping (DefaultState) -> Void) {
        state.observe { completion($0) }
    }
}

