//
//  UIStyle.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

public enum UIStyle {
    case light
    case dark
    case custom(UIColor)

    public var mainColor: UIColor {
        switch self {
        case .light:
            return .init(hex: "#F6F7F8")
        case .dark:
            return .init(hex: "#121212")
        case let .custom(color):
            return color
        }
    }

    public var secondaryColor: UIColor {
        switch self {
        case .light:
            return .init(hex: "#121212")
        case .dark:
            return .init(hex: "#F6F7F8")
        case let .custom(color):
            return color.isDarkColor ? .white : .black
        }
    }
}
