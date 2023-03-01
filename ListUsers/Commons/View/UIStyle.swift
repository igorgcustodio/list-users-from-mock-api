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
            return .color(.white)
        case .dark:
            return .color(.black)
        case let .custom(color):
            return color
        }
    }

    public var secondaryColor: UIColor {
        switch self {
        case .light:
            return .color(.black)
        case .dark:
            return .color(.white)
        case let .custom(color):
            return color.isDarkColor ? .white : .black
        }
    }
}
