//
//  ViewCodeConfiguration.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation

public protocol ViewCodeConfiguration: AnyObject {
    func setupViewCode()
    func setupViewHierarchy()
    func setupConstraints()
    func configureViews()
    func setupAccessibility()
}

extension ViewCodeConfiguration {
    public func setupViewCode() {
        setupViewHierarchy()
        setupConstraints()
        configureViews()
        setupAccessibility()
    }

    public func setupViewHierarchy() {}
    public func setupConstraints() {}
    public func configureViews() {}
    public func setupAccessibility() {}
}
