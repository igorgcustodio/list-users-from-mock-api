//
//  UIButton+.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

extension UIButton {

    public static func buildButton(with title: String, style: CustomButton.Style) -> CustomButton {
        let button: CustomButton = .init(title: title, style: style)
        return button
    }
}
