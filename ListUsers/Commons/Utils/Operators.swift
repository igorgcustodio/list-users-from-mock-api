//
//  Operators.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import Foundation

infix operator <?: ComparisonPrecedence
infix operator >?: ComparisonPrecedence

public func <? <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    if let lhs = lhs, let rhs = rhs {
        return lhs < rhs
    } else {
        return lhs == nil && rhs != nil
    }
}

public func >? <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    if let lhs = lhs, let rhs = rhs {
        return lhs > rhs
    } else {
        return lhs != nil && rhs == nil
    }
}
