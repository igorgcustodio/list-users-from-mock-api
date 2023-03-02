//
//  ErrorType.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation

public enum ErrorType: Error {

    case input(InputValidatorError)
    case request(NetworkingErrorType)

    public var localizedDescription: String {
        switch self {
        case let .input(error):
            return error.message
        case let .request(error) where error == .invalidURL:
            return error.localizedDescription
        default:
            return "Something went wrong! Could you come back in a few moments?"
        }
    }
}
