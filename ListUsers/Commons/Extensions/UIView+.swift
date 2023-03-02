//
//  UIView+.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import UIKit
import SnapKit

extension UIView {

    public static func buildDivider(
        style: UIStyle = .dark,
        height: CGFloat = Layout.Height.height1,
        alpha: CGFloat = 1
    ) -> UIView {
        let view = UIView.emptyView
        view.backgroundColor = style.mainColor
        view.alpha = alpha

        view.snp.makeConstraints { make in
            make.height.equalTo(height)
        }

        return view
    }

    public func addShadow(color: UIColor = .color(.black), opacity: Float = 0.2, offset: CGSize = CGSize(width: 1.0, height: 3.0), radius: CGFloat = 3.0) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }

    public static var emptyView: UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    public func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }

    public var height: CGFloat {
        frame.height
    }

    public var width: CGFloat {
        frame.width
    }

    public var top: CGFloat {
        frame.origin.y
    }

    public var bottom: CGFloat {
        frame.maxY
    }

    public var left: CGFloat {
        frame.origin.x
    }

    public var right: CGFloat {
        frame.maxX
    }

    public func cornerRadius(with radius: CGFloat = 4) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
