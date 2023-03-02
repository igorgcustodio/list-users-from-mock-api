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
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation(style: .light)
    }

    // MARK: - Methods

    private func setup() {
        setupUI()
        observeStates()
    }

    private func observeStates() {
        viewModel.observeStates { [weak self] state in
            guard let self else { return }
            switch state {
            case .normal:
                self.handleNormalState()
            case .loading:
                self.handleLoadingState()
            case .success:
                self.stopLoader()
            case let .failure(error):
                self.handleFailureState(with: error)
            }
        }
    }
}

extension GetServerViewController: UIHelper {
    func setupButtons() {
        contentView.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    func setupTextFields() {
        contentView.textField.delegate = self
        contentView.textField.becomeFirstResponder()
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
