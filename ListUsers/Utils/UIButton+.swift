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
        button.setTitleColor(.init(hex: "#f6f7f8"), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .init(hex: "ff7e00")
        return button
    }
}
