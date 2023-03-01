//
//  Colors.swift
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

extension UIColor {

    public enum DesinSystemColors {

        public enum Brand: Equatable, CaseIterable {
            case primary01
            case primary02
            case secondary01
            case secondary02

            public var rawValue: UIColor {
                switch self {
                case .primary01:
                    return AppSettings.theme.brand.primary01
                case .primary02:
                    return AppSettings.theme.brand.primary02
                case .secondary01:
                    return AppSettings.theme.brand.secondary01
                case .secondary02:
                    return AppSettings.theme.brand.secondary02
                }
            }
        }

        public enum Action: Equatable, CaseIterable {
            case colorA
            case colorB
            case colorC
            case colorD
            case colorE

            public var rawValue: UIColor {
                switch self {

                case .colorA:
                    return AppSettings.theme.action.colorA
                case .colorB:
                    return AppSettings.theme.action.colorB
                case .colorC:
                    return AppSettings.theme.action.colorC
                case .colorD:
                    return AppSettings.theme.action.colorD
                case .colorE:
                    return AppSettings.theme.action.colorE
                }
            }
        }

        public enum Support: Equatable, CaseIterable {
            case blueDark2
            case blueDark1
            case bluePure
            case blueLight1
            case blueLight2

            case aquaDark2
            case aquaDark1
            case aquaPure
            case aquaLight1
            case aquaLight2

            case greenDark2
            case greenDark1
            case greenPure
            case greenLight1
            case greenLight2

            case orangeDark2
            case orangeDark1
            case orangePure
            case orangeLight1
            case orangeLight2

            case redDark2
            case redDark1
            case redPure
            case redLight1
            case redLight2

            case pinkDark2
            case pinkDark1
            case pinkPure
            case pinkLight1
            case pinkLight2

            case purpleDark2
            case purpleDark1
            case purplePure
            case purpleLight1
            case purpleLight2

            public var rawValue: UIColor {
                switch self {

                case .blueDark2:
                    return AppSettings.theme.support.blue.dark2
                case .blueDark1:
                    return AppSettings.theme.support.blue.dark1
                case .bluePure:
                    return AppSettings.theme.support.blue.pure
                case .blueLight1:
                    return AppSettings.theme.support.blue.light1
                case .blueLight2:
                    return AppSettings.theme.support.blue.light2
                case .aquaDark2:
                    return AppSettings.theme.support.aqua.dark2
                case .aquaDark1:
                    return AppSettings.theme.support.aqua.dark1
                case .aquaPure:
                    return AppSettings.theme.support.aqua.pure
                case .aquaLight1:
                    return AppSettings.theme.support.aqua.light1
                case .aquaLight2:
                    return AppSettings.theme.support.aqua.light2
                case .greenDark2:
                    return AppSettings.theme.support.green.dark2
                case .greenDark1:
                    return AppSettings.theme.support.green.dark1
                case .greenPure:
                    return AppSettings.theme.support.green.pure
                case .greenLight1:
                    return AppSettings.theme.support.green.light1
                case .greenLight2:
                    return AppSettings.theme.support.green.light2
                case .orangeDark2:
                    return AppSettings.theme.support.orange.dark2
                case .orangeDark1:
                    return AppSettings.theme.support.orange.dark1
                case .orangePure:
                    return AppSettings.theme.support.orange.pure
                case .orangeLight1:
                    return AppSettings.theme.support.orange.light1
                case .orangeLight2:
                    return AppSettings.theme.support.orange.light2
                case .redDark2:
                    return AppSettings.theme.support.red.dark2
                case .redDark1:
                    return AppSettings.theme.support.red.dark1
                case .redPure:
                    return AppSettings.theme.support.red.pure
                case .redLight1:
                    return AppSettings.theme.support.red.light1
                case .redLight2:
                    return AppSettings.theme.support.red.light2
                case .pinkDark2:
                    return AppSettings.theme.support.pink.dark2
                case .pinkDark1:
                    return AppSettings.theme.support.pink.dark1
                case .pinkPure:
                    return AppSettings.theme.support.pink.pure
                case .pinkLight1:
                    return AppSettings.theme.support.pink.light1
                case .pinkLight2:
                    return AppSettings.theme.support.pink.light2
                case .purpleDark2:
                    return AppSettings.theme.support.purple.dark2
                case .purpleDark1:
                    return AppSettings.theme.support.purple.dark1
                case .purplePure:
                    return AppSettings.theme.support.purple.pure
                case .purpleLight1:
                    return AppSettings.theme.support.purple.light1
                case .purpleLight2:
                    return AppSettings.theme.support.purple.light2
                }
            }
        }

        public enum Neutral: Equatable, CaseIterable {
            case white
            case gray01
            case gray02
            case gray03
            case black

            var rawValue: UIColor {
                switch self {
                case .white:
                    return AppSettings.theme.neutral.white
                case .gray01:
                    return AppSettings.theme.neutral.gray01
                case .gray02:
                    return AppSettings.theme.neutral.gray02
                case .gray03:
                    return AppSettings.theme.neutral.gray03
                case .black:
                    return AppSettings.theme.neutral.black
                }
            }
        }
    }

    public static func color(_ type: DesinSystemColors.Brand) -> UIColor {
        return type.rawValue
    }

    public static func color(_ type: DesinSystemColors.Action) -> UIColor {
        return type.rawValue
    }

    public static func color(_ type: DesinSystemColors.Support) -> UIColor {
        return type.rawValue
    }

    public static func color(_ type: DesinSystemColors.Neutral) -> UIColor {
        return type.rawValue
    }
}

