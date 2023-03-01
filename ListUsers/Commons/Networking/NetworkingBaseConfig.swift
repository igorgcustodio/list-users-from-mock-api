//
//  NetworkingBaseConfig.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import Foundation

struct NetworkingManagerConfig {
    let baseUrl: String

    init(baseUrl: String = AppSettings.baseUrl) {
        self.baseUrl = baseUrl
    }
}
