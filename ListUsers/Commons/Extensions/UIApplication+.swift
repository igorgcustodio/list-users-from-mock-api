//
//  UIApplication+.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit

extension UIApplication {
    public var keyWindow: UIWindow? {
        UIApplication.shared.windows.filter { $0.isKeyWindow == true }.first
    }
}

class Util {
    private static var keyWindow: UIWindow? { UIApplication.shared.keyWindow }

    public class func topViewController() -> UIViewController? {
        func topViewController(from controller: UIViewController?) -> UIViewController? {
            if let navigation = controller as? UINavigationController {
                return topViewController(from: navigation.visibleViewController)
            } else if let tab = controller as? UITabBarController, let selected = tab.selectedViewController {
                return topViewController(from: selected)
            } else if let presented = controller?.presentedViewController {
                return topViewController(from: presented)
            }

            return controller
        }

        return topViewController(from: keyWindow?.rootViewController)
    }

    public class func topNavigationController() -> UIKit.UINavigationController? {
        topViewController()?.navigationController
    }
}
