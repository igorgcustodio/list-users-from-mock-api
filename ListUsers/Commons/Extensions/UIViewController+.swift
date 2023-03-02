//
//  UIViewController+Extensions.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit

extension UIViewController {

    public func setupNavigation(with title: String? = nil, style: UIStyle) {
        navigationController?.setNavigationBarHidden(false, animated: false)

        if let title {
            self.title = title
        }

        navigationController?.navigationBar.tintColor = style.secondaryColor
        navigationController?.navigationBar.barTintColor = style.mainColor
        navigationController?.navigationBar.backgroundColor = style.mainColor

        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: style.secondaryColor
        ]
    }

    public func showLoader() {
        CustomLoaderViewController.shared.start()
    }

    public func stopLoader() {
        CustomLoaderViewController.shared.stop()
    }
}
