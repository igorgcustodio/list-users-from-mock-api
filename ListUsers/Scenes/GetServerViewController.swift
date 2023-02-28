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

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension GetServerViewController: UIHelper {
    func setupNavigationBar() {
        setupNavigation(style: .light)
    }

    func setupButtons() {
        contentView.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    func setupTextFields() {
        contentView.textField.delegate = self
        contentView.textField.becomeFirstResponder()
        contentView.textField.text = "https://6185073a23a2fe0017fff312.mockapi.io"
    }
}

extension GetServerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nextButtonTapped()
        return true
    }

}

extension GetServerViewController {
    @objc func nextButtonTapped() {
        contentView.textField.resignFirstResponder()
        viewModel.getUserList(for: contentView.textField.text)
    }
}
