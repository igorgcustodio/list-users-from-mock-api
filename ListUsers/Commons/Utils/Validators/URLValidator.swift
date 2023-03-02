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

        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        if NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: text) {
            return nil
        } else {
            return URLValidatorMessages.invalidFormat
        }
    }
}
