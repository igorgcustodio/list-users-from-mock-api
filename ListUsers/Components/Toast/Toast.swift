//
//  Toast.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit
import SnapKit

final class Toast {

    // MARK: - Properties

    private static var toast: ToastView?
    private static var automaticDismiss = true
    private static var timer: Timer?

    private static var frame: CGRect {
        let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? .zero
        return CGRect(
            x: Layout.Margin.margin8,
            y: Layout.Margin.margin8 + topPadding,
            width: UIScreen.main.bounds.width - Layout.Margin.margin16,
            height: Layout.Height.height80
        )
    }

    // MARK: - Methods

    public init() {}

    /// Display a toast at the top of the screen
    ///
    /// - Parameters:
    ///   - content: Content of ToastView
    ///   - automaticDismiss: controls if the toast is dismissed automatically or needs an user action
    public static func show(
        with content: ToastView.Content,
        automaticDismiss: Bool = true
    ) {
        DispatchQueue.main.async {
            guard
                self.toast == nil,
                let currentWindow = UIApplication.shared.keyWindow
            else {
                finish()
                return
            }
            self.automaticDismiss = automaticDismiss
            self.toast = .init(content: content, frame: frame)

            guard let toast = self.toast else { return }
            currentWindow.addSubview(toast)
            self.setupToastInteraction()
            self.presentToast()
        }
    }

    /// Dismiss the toast
    public static func dismissToast() {
        guard let toast = toast else { return }
        UIView.animate(withDuration: Timing.Interval.time05, animations: {
            toast.transform = CGAffineTransform(translationX: .zero, y: -toast.frame.maxY)
        }, completion: { _ in
            finish()
        })
    }
}

// MARK: - Interaction handler

extension Toast {
    @objc private static func didSwipe() {
        dismissToast()
        finish()
    }

    @objc private static func didTouch() {
        dismissToast()
        finish()
    }
}

// MARK: - Showing helpers

extension Toast {
    private static func setupToastInteraction() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        swipeUp.direction = .up
        toast?.addGestureRecognizer(swipeUp)
        toast?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTouch)))
    }

    private static func presentToast() {
        guard let toast = toast else { return }

        toast.transform = CGAffineTransform(translationX: .zero, y: -toast.frame.maxY)
        UIView.animate(withDuration: Timing.Interval.time05, animations: {
            toast.transform = .identity
        }, completion: { _ in
            if automaticDismiss {
                timer = Timer.scheduledTimer(withTimeInterval: Timing.Interval.time05, repeats: false) { _ in
                    dismissToast()
                }
            }
        })
    }

    private static func finish() {
        timer?.invalidate()
        toast?.removeFromSuperview()
        toast = nil
    }
}
