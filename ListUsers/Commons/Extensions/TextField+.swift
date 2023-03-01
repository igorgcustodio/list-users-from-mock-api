//
//  TextField+.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit
import SnapKit

extension UITextField {
    public static func buildTextField(
        placeholder: String? = nil
    ) -> UITextField {
        let textField: CustomTextField = .init(insets: .init(top: 8, left: 8, bottom: 8, right: 8))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.placeholder = placeholder
        textField.keyboardType = .URL
        

        return textField
    }
}

final class CustomTextField: UITextField {

    let insets: UIEdgeInsets

    init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: .zero)
        addBorder()
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
