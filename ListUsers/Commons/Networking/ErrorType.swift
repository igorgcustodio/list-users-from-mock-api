//
//  ErrorType.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation

public enum ErrorType: Error, LocalizedError {
    

    public var description: String? {
        switch self {
        default:
            return "Our system is under maintenance! Could you come back in a few moments?"
        }
    }
}
