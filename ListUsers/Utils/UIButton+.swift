//
//  UIButton+.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

extension UIButton {

    public static func buildButton(with title: String) -> UIButton {
        let button: Self = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(.color(.white), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .color(.orangeLight1)
        return button
    }
}
