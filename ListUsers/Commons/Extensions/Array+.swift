//
//  Array+.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import Foundation

extension Array {

    // MARK: - Properties

    public var isNotEmpty: Bool { !isEmpty }

    public var lastIndex: Int { count - 1 }

    public static var empty: [Element] { [] }

    // MARK: - Subscripts

    public subscript(safe index: Int?) -> Element? {
        guard let index = index, index >= .zero, index < endIndex else { return nil }
        return self[index]
    }

    // MARK: - Methods

    public func isLast(_ index: Int) -> Bool {
        count - 1 == index
    }
}
