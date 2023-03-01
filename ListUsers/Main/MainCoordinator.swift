//
//  MainCoordinator.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit

final class MainCoordinator: Coordinator {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController ?? .init()
    }

    func start() {
        let viewModel = GetServerViewModel(coordinator: self)
        let viewController = GetServerViewController(viewModel: viewModel)
        handlePresentation(with: viewController)
    }
}

extension MainCoordinator {
    static func makeMainCoordinator(within navigationController: UINavigationController) -> MainCoordinator {
        return MainCoordinator(navigationController: navigationController)
    }
}

extension MainCoordinator: CoordinatorCommonDelegate {
}

extension MainCoordinator: GetServerViewModelCoordinatorDelegate {
    func openUsersList(users: [UserDataModel]) {
        let viewModel = UsersListingViewModel(usersList: users)
        let viewController = UsersListingViewController(viewModel: viewModel)
        handlePresentation(with: viewController)
    }
}
