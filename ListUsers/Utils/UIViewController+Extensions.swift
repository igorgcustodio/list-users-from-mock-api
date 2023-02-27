//
//  UIViewController+Extensions.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit

extension UIViewController {

    public func setupNavigationBar(with title: String? = nil) {
        navigationController?.setNavigationBarHidden(false, animated: false)

        if let title {
            self.title = title
        }
    }
}
