//
//  Theme.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit

enum Theme {
    struct Colors {
        var brand: BrandColor
        var action: ActionColor
        var support: SupportColor
        var neutral: NeutralColor

        init(
            brand: BrandColor,
            action: ActionColor = .init(),
            support: SupportColor = .init(),
            neutral: NeutralColor = .init()
        ) {
            self.brand = brand
            self.action = action
            self.support = support
            self.neutral = neutral
        }
    }

    struct BrandColor {
        var primary01: UIColor
        var primary02: UIColor
        var secondary01: UIColor
        var secondary02: UIColor
    }

    struct ActionColor {
        var colorA: UIColor
        var colorB: UIColor
        var colorC: UIColor
        var colorD: UIColor
        var colorE: UIColor

        init(
            colorA: UIColor = .init(hex: "#FA824C"), // Orange
            colorB: UIColor = .init(hex: "#A2D729"), // Green
            colorC: UIColor = .init(hex: "#3C91E6"), // Blue
            colorD: UIColor = .init(hex: "#EE4266"), // Pink
            colorE: UIColor = .init(hex: "#2A1E5C") // Purple
        ) {
            self.colorA = colorA
            self.colorB = colorB
            self.colorC = colorC
            self.colorD = colorD
            self.colorE = colorE
        }
    }

    struct SupportColor {
        var blue: ColorRange
        var green: ColorRange
        var aqua: ColorRange
        var orange: ColorRange
        var red: ColorRange
        var pink: ColorRange
        var purple: ColorRange
        var yellow: ColorRange

        init(
            blue: ColorRange = .init(pure: .init(hex: "#428CF2")),
            green: ColorRange = .init(pure: .init(hex: "#419487")),
            aqua: ColorRange = .init(pure: .init(hex: "#52BBD0")),
            orange: ColorRange = .init(pure: .init(hex: "#ECA064")),
            red: ColorRange = .init(pure: .init(hex: "#DE545E")),
            pink: ColorRange = .init(pure: .init(hex: "#DD5B93")),
            purple: ColorRange = .init(pure: .init(hex: "#604AF1")),
            yellow: ColorRange = .init(pure: .init(hex: "#"))
        ) {
            self.blue = blue
            self.green = green
            self.aqua = aqua
            self.orange = orange
            self.red = red
            self.pink = pink
            self.purple = purple
            self.yellow = yellow
        }
    }

    struct ColorRange {
        var dark2: UIColor
        var dark1: UIColor
        var pure: UIColor
        var light1: UIColor
        var light2: UIColor

        init(dark2: UIColor, dark1: UIColor, pure: UIColor, light1: UIColor, light2: UIColor) {
            self.dark2 = dark2
            self.dark1 = dark1
            self.pure = pure
            self.light1 = light1
            self.light2 = light2
        }

        init(pure: UIColor) {
            self.dark2 = pure.withLuminosity(0.15)
            self.dark1 = pure.withLuminosity(0.3)
            self.pure = pure
            self.light1 = pure.withLuminosity(0.6)
            self.light2 = pure.withLuminosity(0.9)
        }
    }

    struct NeutralColor {
        var white: UIColor
        var gray01: UIColor
        var gray02: UIColor
        var gray03: UIColor
        var black: UIColor

        init(
            white: UIColor = .init(hex: "#fcfcfc"),
            gray01: UIColor = .init(hex: "#cfcfcf"),
            gray02: UIColor = .init(hex: "#9e9e9e"),
            gray03: UIColor = .init(hex: "#7d7d7d"),
            black: UIColor = .init(hex: "191919")
        ) {
            self.white = white
            self.gray01 = gray01
            self.gray02 = gray02
            self.gray03 = gray03
            self.black = black
        }
    }

}
