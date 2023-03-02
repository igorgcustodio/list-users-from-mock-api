//
//  CustomLabel.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import UIKit

public final class CustomLabel: UILabel {

    private let style: TextStyle
    private let color: UIColor

    public init(
        style: TextStyle,
        color: UIColor,
        numberOfLines: Int = .one
    ) {
        self.style = style
        self.color = color
        super.init(frame: .zero)
        setupView()
        self.numberOfLines = numberOfLines
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomLabel {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        setStyle(style, color: color)
    }
}
