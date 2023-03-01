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
        let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        return CGRect(
            x: 8,
            y: 8 + topPadding,
            width: UIScreen.main.bounds.width - 16,
            height: 80
        )
    }

    // MARK: - Methods

    public init() {}

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

    private static func setupToastInteraction() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        swipeUp.direction = .up
        toast?.addGestureRecognizer(swipeUp)
        toast?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTouch)))
    }

    @objc private static func didSwipe() {
        dismissToast()
        finish()
    }

    @objc private static func didTouch() {
        dismissToast()
        finish()
    }

    private static func presentToast() {
        guard let toast = toast else { return }

        toast.transform = CGAffineTransform(translationX: 0, y: -toast.frame.maxY)
        UIView.animate(withDuration: 0.5, animations: {
            toast.transform = .identity
        }, completion: { _ in
            if automaticDismiss {
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    dismissToast()
                }
            }
        })
    }

    public static func dismissToast() {
        guard let toast = toast else { return }
        UIView.animate(withDuration: 0.5, animations: {
            toast.transform = CGAffineTransform(translationX: 0, y: -toast.frame.maxY)
        }, completion: { _ in
            finish()
        })
    }

    private static func finish() {
        timer?.invalidate()
        toast?.removeFromSuperview()
        toast = nil
    }
}
