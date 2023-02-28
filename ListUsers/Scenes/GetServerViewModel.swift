//
//  GetServerViewModel.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit

protocol GetServerViewModelProtocol: AnyObject {

}

final class GetServerViewModel {

    // MARK: - Properties

    private let coordinator: CoordinatorCommonDelegate

    // MARK: - Init

    init(coordinator: CoordinatorCommonDelegate) {
        self.coordinator = coordinator
    }
}

extension GetServerViewModel: GetServerViewModelProtocol {

}

enum Path: EndpointType {
    case getUsers

    var path: String {
        "https://6185073a23a2fe0017fff312.mockapi.io/api/v1/user"
    }
    var method: HTTPMethod {
        .get
    }
    var body: HTTPBody? { nil }
}

import Foundation

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

