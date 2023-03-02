//
//  CustomLoader.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import UIKit

public final class CustomLoader: UIView {

    public static let shared = CustomLoader()
    private var baseView: UIView?
    private var isShowing = false

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

        blurEffectView.autoresizingMask = [
            .flexibleWidth, .flexibleHeight
        ]

        return blurEffectView
    }()


    public func start(in view: UIView) {
        DispatchQueue.main.async {
            guard !self.isShowing else { return }
            self.isShowing = true
            self.addLoaderTo(to: view)
        }
    }

    private func addLoaderTo(to view: UIView) {
        baseView = .init(
            frame: .init(
                x: .zero,
                y: -Layout.Margin.margin20,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height + Layout.Margin.margin20
            )
        )

        if let baseView {
            isUserInteractionEnabled = false
            baseView.backgroundColor = UIColor.black.withAlphaComponent(0.5)

            blurEffectView.frame = bounds
            baseView.insertSubview(blurEffectView, at: 0)

            loadingActivityIndicator.center = CGPoint(
                x: baseView.bounds.midX,
                y: baseView.bounds.midY
            )
            baseView.addSubview(loadingActivityIndicator)
            view.addSubview(baseView)
        }

    }

    public func stop() {
        DispatchQueue.main.async {
            self.removeAnimation()
        }
    }

    private func removeAnimation() {
        loadingActivityIndicator.removeFromSuperview()
        blurEffectView.removeFromSuperview()
        baseView?.removeFromSuperview()
        isUserInteractionEnabled = true
        isShowing = false
    }
}

extension UIViewController {
    public func startLoader() {
        DispatchQueue.main.async {
            CustomLoader.shared.start(in: self.view)
        }
    }

    public func stopLoader() {
        DispatchQueue.main.async {
            CustomLoader.shared.stop()
        }
    }
}
