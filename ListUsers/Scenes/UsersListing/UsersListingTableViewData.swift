//
//  UsersListingTableViewData.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation

enum UsersListingSectionType: TableViewEnumType {
    case users
}

enum UsersListingRowType: TableViewEnumType {
    case user(UsersListingViewData)
}

final class UsersListingTableViewData: TableViewData<UsersListingSectionType, UsersListingRowType> {}
