//
//  UILabel+.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

public enum TextStyle: CaseIterable {
    // Title - size 24
    case title
    // Commons texts - size 15
    case label
    // Description - size 12
    case description

    public var size: CGFloat {
        switch self {
        case .title:
            return 24
        case .label:
            return 15
        case .description:
            return 12
        }
    }
}

extension UILabel {
    public static func buildLabel(
        style: TextStyle,
        color: UIColor,
        numberOfLines: Int = .one,
        isHidden: Bool = false,
        text: String? = nil
    ) -> UILabel {
        let label = createLabel(style: style, color: color, numberOfLines: numberOfLines, isHidden: isHidden)

        if let text {
            label.text = text
        }

        return label
    }

    public static func buildLabel(
        style: TextStyle,
        color: UIColor,
        numberOfLines: Int = .one,
        isHidden: Bool = false,
        attributedText: NSAttributedString? = nil
    ) -> UILabel {
        let label = createLabel(style: style, color: color, numberOfLines: numberOfLines, isHidden: isHidden)

        if let attributedText {
            label.attributedText = attributedText
        }

        return label
    }

    fileprivate static func createLabel(
        style: TextStyle,
        color: UIColor,
        numberOfLines: Int = .one,
        isHidden: Bool = false
    ) -> UILabel {
        let label: Self = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = isHidden
        label.numberOfLines = numberOfLines
        label.setStyle(style, color: color)

        return label
    }

    public func setStyle(_ style: TextStyle, color: UIColor) {
        textColor = color
        font = .systemFont(ofSize: style.size)
    }
}
