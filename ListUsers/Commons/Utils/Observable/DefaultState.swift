//
//  DefaultState.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import Foundation
import Alamofire

public enum DefaultState {
    case normal
    case loading
    case success
    case failure(error: AFError)
}
