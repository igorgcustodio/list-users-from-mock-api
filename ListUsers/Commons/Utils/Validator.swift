//
//  Validator.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import Foundation

public protocol InputValidatorError: Error {
    var message: String { get }
}

public protocol InputValidator {
    func validate(_ text: String?) -> InputValidatorError?
}
