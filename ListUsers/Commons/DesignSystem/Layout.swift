//
//  Layout.swift
//  ListUsers
//
//  Created by Igor Custodio on 01/03/23.
//

import UIKit

enum Layout {

    public enum Margin {
        public static let margin2: CGFloat = 2.0
        public static let margin4: CGFloat = 4.0
        public static let margin6: CGFloat = 6.0
        public static let margin8: CGFloat = 8.0
        public static let margin10: CGFloat = 10.0
        public static let margin12: CGFloat = 12.0
        public static let margin14: CGFloat = 14.0
        public static let margin16: CGFloat = 16.0
        public static let margin18: CGFloat = 18.0
        public static let margin20: CGFloat = 20.0
        public static let margin24: CGFloat = 24.0
        public static let margin26: CGFloat = 26.0
        public static let margin28: CGFloat = 28.0
        public static let margin30: CGFloat = 30.0
        public static let margin32: CGFloat = 32.0
        public static let margin34: CGFloat = 34.0
        public static let margin36: CGFloat = 36.0
        public static let margin38: CGFloat = 38.0
        public static let margin40: CGFloat = 40.0
        public static let margin44: CGFloat = 44.0
        public static let margin48: CGFloat = 48.0
    }

    public enum Height {
        public static let height1: CGFloat = 0.1
        public static let height10: CGFloat = 10.0
        public static let height16: CGFloat = 16.0
        public static let height20: CGFloat = 20.0
        public static let height24: CGFloat = 24.0
        public static let height32: CGFloat = 32.0
        public static let height36: CGFloat = 36.0
        public static let height40: CGFloat = 40.0
        public static let height44: CGFloat = 44.0
        public static let height48: CGFloat = 48.0
        public static let height52: CGFloat = 52.0
        public static let height56: CGFloat = 56.0
        public static let height64: CGFloat = 64.0
        public static let height80: CGFloat = 80.0
    }

    public enum Shadow {
        public static let color: UIColor = .color(.black)
        public static let opacity: Float = 0.1
        public static let offset = CGSize(width: 0, height: -1)
        public static let radius: CGFloat = 0
    }

    public enum CornerRadius {
        public static let radius4: CGFloat = 4
        public static let radius5: CGFloat = 5
        public static let radius8: CGFloat = 8
        public static let radius10: CGFloat = 10
        public static let radius15: CGFloat = 15
        public static let radius18: CGFloat = 18
        public static let radius20: CGFloat = 20
        public static let radius24: CGFloat = 24
        public static let radius25: CGFloat = 25
        public static let radius30: CGFloat = 30
    }
}
