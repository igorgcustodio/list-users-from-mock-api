//
//  UIEdgeInsets+.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import UIKit

extension UIEdgeInsets {

    public init(all value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }

    public init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
