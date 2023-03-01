//
//  Toast.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit
import SnapKit

final class Toast {

    private static var frame: CGRect {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        return CGRect(
            x: 8,
            y: 8 + topPadding,
            width: UIScreen.main.bounds.width - 16,
            height: 225
        )
    }
}
