//
//  UserDataModel.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation

struct UserDataModel: Decodable, Comparable, Hashable {
    static func < (lhs: UserDataModel, rhs: UserDataModel) -> Bool {
        return lhs.profile?.firstName <? rhs.profile?.firstName
    }

    static func == (lhs: UserDataModel, rhs: UserDataModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(username)
    }

    let createdAt: String?
    let name: String?
    let avatar: String?
    let username: String?
    let knownIPS: [String]?
    let profile: Profile?
    let id: String?
}

struct Profile: Decodable {
    let firstName: String?
    let lastName: String?
    let staticData: [Int]?

    var completeName: String {
        return "\(firstName ?? .empty) \(lastName ?? .empty)"
    }
}

