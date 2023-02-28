//
//  ErrorType.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation

public enum ErrorType: Error, LocalizedError {
    case noResponse
    case timeout
    case cancelled
    case defaultError(statusCode: Int)
    case serverError
    case badRequest
    case notFound
    case noData
    case failedToDecodeError(data: Data, statusCode: Int)

    case failedToParseUrl
    case failedToDecode
    case failedToEncode

    public var description: String? {
        switch self {
        case .timeout:
            return "Timeout exceeded! Try again."
        case .notFound:
            return "The request data was not found"
        default:
            return "Our system is under maintenance! Could you come back in a few moments?"
        }
    }
}

extension Error {
    var isConnectivityError: Bool {
        // let code = self._code || Can safely bridged to NSError, avoid using _ members
        let code = (self as NSError).code

        if code == NSURLErrorTimedOut {
            return true // time-out
        }

        if self._domain != NSURLErrorDomain {
            return false // Cannot be a NSURLConnection error
        }

        switch code {
        case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost, NSURLErrorCannotConnectToHost:
            return true
        default:
            return false
        }
    }

    var isTaskCancelled: Bool {
        let code = (self as NSError).code
        return code == NSURLErrorCancelled
    }
}
