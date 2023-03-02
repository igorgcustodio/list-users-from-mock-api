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
        let textField: CustomTextField = .init(
            keyboardType: .URL,
            placeholder: placeholder
        )

        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no

        return textField
    }
}

