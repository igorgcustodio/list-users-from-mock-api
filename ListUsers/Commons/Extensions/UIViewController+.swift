//
//  UIViewController+Extensions.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import UIKit
import Alamofire

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

    public func handleNormalState() {
        navigationController?.stopLoader()
    }

    public func handleLoadingState() {
        navigationController?.startLoader()
    }

    public func handleSuccessState() {
        navigationController?.stopLoader()
    }

    public func handleFailureState(with error: AFError) {
        navigationController?.stopLoader()
        Toast.show(with: .init(text: error.localizedDescription))
    }
}
