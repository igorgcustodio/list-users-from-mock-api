//
//  Colors.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit

extension UIColor {

    public enum DesignSystemColors {

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

    public static func color(_ type: DesignSystemColors.Brand) -> UIColor {
        return type.rawValue
    }

    public static func color(_ type: DesignSystemColors.Action) -> UIColor {
        return type.rawValue
    }

    public static func color(_ type: DesignSystemColors.Support) -> UIColor {
        return type.rawValue
    }

    public static func color(_ type: DesignSystemColors.Neutral) -> UIColor {
        return type.rawValue
    }
}

