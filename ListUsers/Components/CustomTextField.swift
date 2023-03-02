//
//  CustomTextField.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import UIKit

final class CustomTextField: UITextField {

    let insets: UIEdgeInsets

    init(
        insets: UIEdgeInsets = .init(all: Layout.Margin.margin8),
        keyboardType: UIKeyboardType,
        placeholder: String? = nil
    ) {
        self.insets = insets
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        addBorder()
    }

    private func addBorder() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .color(.gray01)
        addSubview(view)

        view.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
    }
}
