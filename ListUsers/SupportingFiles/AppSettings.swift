//
//  AppSettings.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import Foundation

enum AppSettings {

    static var baseUrl: String { "" }
    static var theme: Theme.Colors {
        .init(
            brand: .init(
                primary01: .init(hex: "#FF6978"),
                primary02: .init(hex: "#B1EDE8"),
                secondary01: .init(hex: "#6D435A"),
                secondary02: .init(hex: "#352D39")
            )
        )
    }
}
