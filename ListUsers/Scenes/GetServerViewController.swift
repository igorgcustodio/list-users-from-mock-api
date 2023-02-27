//
//  GetServerViewController.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit

final class GetServerViewController: LoadableViewController<GetServerView> {

    // MARK: - Properties

    private let viewModel: GetServerViewModelProtocol

    // MARK: - Init

    init(viewModel: GetServerViewModelProtocol) {
        self.viewModel = viewModel

        super.init()
    }

    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupNavigation()
    }

    func setupNavigation() {
        setupNavigationBar(with: "Enter server URL")
    }

}
