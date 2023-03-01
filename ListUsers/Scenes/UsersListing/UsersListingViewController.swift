//
//  UsersListingViewController.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

// MARK: - Class

final class UsersListingViewController: LoadableViewController<UsersListingView> {

    // MARK: - Properties

    private let viewModel: UsersListingViewModelProtocol

    // MARK: - Init

    init(viewModel: UsersListingViewModelProtocol) {
        self.viewModel = viewModel

        super.init()
    }

    // MARK: - Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Methods

    private func setup() {
        setupUI()
    }
}

// MARK: - UIHelper

extension UsersListingViewController: UIHelper {
    func setupNavigationBar() {
        setupNavigation(with: "List of Users", style: .light)
    }

    func setupTableViews() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.register(UsersListingTableViewCell.self)
    }
}

// MARK: - TableView

extension UsersListingViewController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(at: section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.item(at: indexPath)

        switch cellType {
        case let .user(userData):
            let cell: UsersListingTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setup(with: userData)
            return cell
        }
    }
}
