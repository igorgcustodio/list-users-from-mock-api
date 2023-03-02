//
//  UILabel+.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

extension UILabel {
    public static func buildLabel(
        style: TextStyle,
        color: UIColor,
        numberOfLines: Int = .one,
        isHidden: Bool = false,
        text: String? = nil
    ) -> UILabel {
        let label = CustomLabel(style: style, color: color, numberOfLines: numberOfLines)
        label.isHidden = isHidden

        if let text {
            label.text = text
        }

        return label
    }

    public func setStyle(_ style: TextStyle, color: UIColor) {
        textColor = color
        font = .systemFont(ofSize: style.size)
    }
}
