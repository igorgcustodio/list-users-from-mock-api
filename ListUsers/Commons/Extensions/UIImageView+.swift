//
//  UIImageView+.swift
//  Pods
//
//  Created by Igor Custodio on 28/02/23.
//

import UIKit

extension UIImageView {

    public static func buildImageView(image: UIImage? = nil, contentMode: ContentMode = .scaleAspectFit) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .color(.gray03)
        imageView.contentMode = contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
