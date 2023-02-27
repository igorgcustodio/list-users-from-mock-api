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
