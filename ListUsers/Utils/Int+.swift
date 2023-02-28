//
//  Int+Extensions.swift
//  ListUsers
//
//  Created by Igor Custodio on 24/02/23.
//

import Foundation

extension Int {

    public static var zero: Self = 0
    public static var one: Self = 1
    public static var two: Self = 2

    public var isZero: Bool { self == .zero }
    public var isNotZero: Bool { self != .zero }

    public var isEven: Bool { self % .two == .zero }
    public var isOdd: Bool { self % .two != .zero }
}
