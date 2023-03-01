//
//  CustomButton.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit

public final class CustomButton: UIButton {

    private let style: Style

    public init(title: String, style: Style) {
        self.style = style
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomButton {
    private func setupView() {
        layer.cornerRadius = Layout.CornerRadius.radius8
        let color = style.background
        backgroundColor = color
        setTitleColor(color.contrastColor, for: .normal)
    }
}

extension CustomButton {
    public enum Style {
        case primary
        case secondary
        case custom(UIColor)

        public var background: UIColor {
            switch self {
            case .primary:
                return .color(.primary01)
            case .secondary:
                return .color(.secondary01)
            case let .custom(color):
                return color
            }
        }
    }
}
