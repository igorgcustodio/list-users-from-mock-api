//
//  UsersListingView.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit
import SnapKit

final class UsersListingView: UIView {

    // MARK: - UI Properties

    private(set) lazy var tableView = UITableView.buildTableView()

    // MARK: - Class Properties

    // MARK: - LifeCycle

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupViewCode()
    }
}

// MARK: - Setup

extension UsersListingView: ViewCodeConfiguration {
    func setupViewHierarchy() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configureViews() {
        tableView.backgroundColor = .init(hex: "#f6f7f8")
    }
}

// MARK: - View builders

private extension UsersListingView {}
