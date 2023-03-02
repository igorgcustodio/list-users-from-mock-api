//
//  CGFloat+.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import UIKit

extension CGFloat {

    public var half: Self { self / 2 }

    public static var topSafeArea: Self {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.top ?? .zero
    }


    public static var bottomSafeArea: Self {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.bottom ?? .zero
    }
}
