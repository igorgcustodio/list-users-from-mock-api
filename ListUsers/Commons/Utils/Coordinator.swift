//
//  Coordinator.swift
//  ListUsers
//
//  Created by Igor Custodio on 24/02/23.
//

import UIKit

public protocol Coordinator: AnyObject {

    // MARK: - Properties

    var navigationController: UINavigationController? { get set }

    // MARK: - Methods

    func start()
    func handlePresentation(with viewController: UIViewController, navigation: UINavigationController?, completion: (() -> Void)?)
}

extension Coordinator {
    public func handlePresentation(with viewController: UIViewController, navigation: UINavigationController? = nil, completion: (() -> Void)? = nil) {
        let navigationController = navigation ?? navigationController ?? .init()
        self.navigationController = navigationController

        if let navigationController = viewController as? UINavigationController,
           navigationController.viewControllers.count > .zero,
           navigationController.presentedViewController == nil {
            UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(navigationController, animated: true, completion: completion)
        } else if navigationController.viewControllers.isEmpty {
            navigationController.setViewControllers([viewController], animated: true)
            navigationController.modalPresentationStyle = .fullScreen
            UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(navigationController, animated: true, completion: completion)
        } else {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}

protocol CoordinatorCommonDelegate: AnyObject {
    func backTapped()
    func closeTapped()
}

extension CoordinatorCommonDelegate {
    func backTapped() {}
    func closeTapped() {}
}
