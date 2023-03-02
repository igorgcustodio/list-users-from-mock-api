//
//  TextStyle.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import UIKit

public enum TextStyle: CaseIterable {
    /// Title - size 24
    case title
    /// Subtitle - size 20
    case subtitle
    /// Commons texts - size 15
    case label
    /// Description - size 12
    case description

    public var size: CGFloat {
        switch self {
        case .title:
            return Layout.Height.height24
        case .subtitle:
            return Layout.Height.height20
        case .label:
            return Layout.Height.height16
        case .description:
            return Layout.Height.height10
        }
    }
}
