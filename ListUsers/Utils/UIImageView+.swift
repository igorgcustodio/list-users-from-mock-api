//
//  UIImageView+.swift
//  Pods
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

extension UIImageView {

    public static func buildImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
