//
//  CustomLoader.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import UIKit

public final class CustomLoaderViewController: UIViewController {

    public static let shared = CustomLoaderViewController()
    private var presentingController: CustomLoaderViewController?

    var loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()

        indicator.style = .medium
        indicator.color = .white

        // The indicator should be animating when
        // the view appears.
        indicator.startAnimating()

        // Setting the autoresizing mask to flexible for all
        // directions will keep the indicator in the center
        // of the view and properly handle rotation.
        indicator.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin
        ]

        return indicator
    }()

    var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)

        blurEffectView.alpha = 0.5

        // Setting the autoresizing mask to flexible for
        // width and height will ensure the blurEffectView
        // is the same size as its parent view.
        blurEffectView.autoresizingMask = [
            .flexibleWidth, .flexibleHeight
        ]

        return blurEffectView
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        // Add the blurEffectView with the same
        // size as view
        blurEffectView.frame = self.view.bounds
        view.insertSubview(blurEffectView, at: 0)

        // Add the loadingActivityIndicator in the
        // center of view
        loadingActivityIndicator.center = CGPoint(
            x: view.bounds.midX,
            y: view.bounds.midY
        )
        view.addSubview(loadingActivityIndicator)
    }

    public func start() {
        let controller = CustomLoaderViewController()
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        controller.view.isUserInteractionEnabled = false
        presentingController = controller
        Util.topViewController()?.present(controller, animated: true)
    }

    public func stop() {
        presentingController?.view.isUserInteractionEnabled = true
        presentingController?.dismiss(animated: true)
        presentingController = nil
    }
}
