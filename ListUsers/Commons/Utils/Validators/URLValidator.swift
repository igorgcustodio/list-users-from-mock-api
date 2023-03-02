//
//  URLValidator.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import Foundation

enum URLValidatorMessages: InputValidatorError {
    case emptyField
    case invalidFormat

    var message: String {
        switch self {
        case .emptyField:
            return "You must enter an address value"
        case .invalidFormat:
            return "You must enter a valid address value"
        }
    }
}

class URLValidator: InputValidator {
    func validate(_ text: String?) -> InputValidatorError? {
        guard let text
        else { return URLValidatorMessages.emptyField }

        let regex = "http[s]?://(([^/:.[:space:]]+(.[^/:.[:space:]]+)*)|([0-9](.[0-9]{3})))(:[0-9]+)?((/[^?#[:space:]]+)([^#[:space:]]+)?(#.+)?)?"
        let test = NSPredicate(format:"SELF MATCHES %@", regex)
        let result = test.evaluate(with: text)

        if result {
            return nil
        } else {
            return URLValidatorMessages.invalidFormat
        }
    }
}
