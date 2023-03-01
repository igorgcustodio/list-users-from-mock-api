//
//  UsersListingViewModel.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

// MARK: - Protocols

protocol UsersListingViewModelProtocol: AnyObject {

    var numberOfSections: Int { get }

    func numberOfItems(at section: Int) -> Int
    func item(at indexPath: IndexPath) -> UsersListingRowType
}

// MARK: - Class

final class UsersListingViewModel {

    // MARK: - Properties

    private let tableViewData: UsersListingTableViewData
    private var usersList: [UserDataModel]

    // MARK: - UsersListingViewModelProtocol init

    required init(usersList: [UserDataModel]) {
        self.tableViewData = .init()
        self.usersList = usersList
        makeRows()
    }

    private func makeRows() {
        let rows = usersList.sorted().map { user -> UsersListingRowType in
            let userData = UsersListingViewData(name: user.profile?.completeName ?? "", avatar: user.avatar ?? "")
            return .user(userData)
        }

        tableViewData.add(sections: .init(rows: rows, type: .users, visible: true))
    }
}

// MARK: - UsersListingViewModelProtocol

extension UsersListingViewModel: UsersListingViewModelProtocol {

    var numberOfSections: Int { tableViewData.visibleSectionCount }

    func numberOfItems(at section: Int) -> Int {
        tableViewData.visibleSections[section].rows.count
    }

    func item(at indexPath: IndexPath) -> UsersListingRowType {
        return tableViewData.visibleSections[indexPath.section].rows[indexPath.row]
    }
}
