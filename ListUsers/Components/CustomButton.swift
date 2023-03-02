//
//  CustomButton.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit

open class CustomButton: UIButton {

    // MARK: - Properties

    private let style: Style

    // MARK: - Init

    public init(title: String, style: Style) {
        self.style = style
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupView()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override methods

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !state.contains(.disabled) {
            performScaleAnimation()
        }
        super.touchesBegan(touches, with: event)
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !state.contains(.disabled) {
            UIView.animate(withDuration: 0.3) {
                self.layer.opacity = 1
            }
        }
        super.touchesEnded(touches, with: event)
    }

    func performScaleAnimation() {
        layer.removeAllAnimations()

        let scaleDownAnimation = CABasicAnimation(keyPath: Config.Animation.type)
        scaleDownAnimation.fromValue = Config.Animation.maxScale
        scaleDownAnimation.toValue = Config.Animation.minScale
        scaleDownAnimation.duration = Config.Animation.scaleDownDuration
        scaleDownAnimation.isRemovedOnCompletion = true
        scaleDownAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        let scaleUpAnimation = CABasicAnimation(keyPath: Config.Animation.type)
        scaleUpAnimation.fromValue = Config.Animation.minScale
        scaleUpAnimation.toValue = Config.Animation.maxScale
        scaleUpAnimation.beginTime = scaleDownAnimation.duration
        scaleUpAnimation.duration = Config.Animation.scaleUpDuration
        scaleUpAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [scaleDownAnimation, scaleUpAnimation]
        animationGroup.duration = scaleDownAnimation.duration + scaleUpAnimation.duration

        layer.add(animationGroup, forKey: Config.Animation.key)

        layer.opacity = 0.8
    }
}

// MARK: - Setup View

extension CustomButton {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = Layout.CornerRadius.radius8
        let color = style.background
        backgroundColor = color
        setTitleColor(color.contrastColor, for: .normal)
    }
}

// MARK: - Constants and ViewData

extension CustomButton {

    // MARK: - Animation Config

    enum Config {
        enum Animation {
            static let type = "transform.scale"
            static let key = "scaleAnimation"
            static let minScale = 0.99
            static let maxScale = 1.0
            static let scaleDownDuration: CFTimeInterval = 0.1
            static let scaleUpDuration: CFTimeInterval = 0.17
        }
    }

    // MARK: - Style data

    public enum Style {
        case primary
        case secondary
        case custom(UIColor)

        public var background: UIColor {
            switch self {
            case .primary:
                return .color(.primary01)
            case .secondary:
                return .color(.secondary01)
            case let .custom(color):
                return color
            }
        }
    }
}
