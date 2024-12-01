//
//  Created by Daniel Pustotin on 30.01.2023.
//

import SwiftUI

public extension Imaginator {
    enum System: String {
        /// Image of 􀄪
        case leftArrow = "arrow.left"
        /// Image of 􀄫
        case rightArrow = "arrow.right"
        /// Image of 􀄯
        case rightUpArrow = "arrow.up.right"
        /// Image of 􀆉
        case leftChevron = "chevron.left"
        /// Image of 􀆊
        case rightChevron = "chevron.right"
        /// Image of 􀋲
        case listBullet = "list.bullet"
        /// Image of 􀊯
        case syncArrows = "arrow.triangle.2.circlepath"
        /// Image of 􀝦
        case palette = "paintpalette.fill"
        /// Image of 􀉪
        case person = "person.fill"
        /// Image of 􁇵
        case curlyBraces = "ellipsis.curlybraces"
        /// Image of 􀉣
        case link = "link"
        /// Image of 􀬨
        case transparentCube = "cube.transparent"
        /// Image of 􀍟
        case gear = "gear"
        /// Image of 􀙥
        case noWiFi = "wifi.exclamationmark"
        /// Image of 􀆄
        case xmark = "xmark"
        /// Image of 􀛮
        case lightbulbOn = "lightbulb.fill"
        /// Image of 􀞄
        case lightbulbOff = "lightbulb.slash.fill"
        /// Image of 􀐱
        case timer = "timer"
        /// Image of 􀇹
        case circlesGrid = "circle.grid.3x3.fill"
        /// Image of 􀊫
        case search = "magnifyingglass"
        /// Image of 􀎟
        case house = "house.fill"
        /// Image of 􀤋
        case tools = "wrench.and.screwdriver.fill"
        /// Image of 􀟯
        case clap = "hands.clap.fill"
        /// Image of 􀃲
        case checkboxChecked = "checkmark.square"
        /// Image of 􀂒
        case checkboxEmpty = "square"
        /// Image of 􀆅
        case checkmark = "checkmark"
        /// Image of 􀆪
        case globe = "globe"
        /// Image of 􀍕
        case envelope = "envelope"
        /// Image of 􀭉
        case questionBoxed = "questionmark.square.dashed"
        /// Image of 􀦇
        case edit = "highlighter"
        /// Image of 􀅍
        case question = "questionmark"
        /// Image of 􀁝
        case questionCircle = "questionmark.circle.fill"
        /// Image of 􀅼
        case plus = "plus"
        /// Image of 􀅽
        case minus = "minus"
        /// Image of 􀊄
        case play = "play.fill"
        /// Image of 􀅴
        case info = "info.circle"
        /// Image of 􀊴
        case heart = "heart"
        /// Image of 􀊵
        case heartFilled = "heart.fill"
        /// Image of 􀆏
        case pickerChevrons = "chevron.up.chevron.down"
        /// Image of 􀄶
        case arrowUpLeft = "arrow.turn.left.up"
        /// Image of 􀉃
        case clipboardPaste = "doc.on.clipboard"
        /// Image of 􀇺
        case checkmarkSeal = "checkmark.seal"
        /// Image of 􀁠
        case xmarkCircle = "xmark.circle"
        /// Image of 􀅷
        case at = "at"
        /// Image of 􀯸
        case chevronBack = "chevron.backward.circle.fill"
        /// Image of 􀈒
        case trash = "trash.fill"
        /// Image of 􀻵
        case signOut = "rectangle.portrait.and.arrow.right"

        // MARK: - Public properties

        public var image: Image {
            // swiftlint:disable:next system_image_usage
            Image(systemName: self.rawValue)
        }
    }
}

public extension Imaginator.System {
    /// System images with numbers
    enum Number {
        /// Image of 􀀻, 􀀽, 􀀿, ..., 􀚼
        case circle(number: Int, fill: Bool)
        /// Image of 􀃋, 􀃍, 􀃏, ..., 􀛢
        case square(number: Int, fill: Bool)

        // MARK: - Public properties

        /// Image with corresponding number
        public var image: Image {
            switch self {
            case let .circle(number, fill):
                // swiftlint:disable:next system_image_usage
                return Image(systemName: number.description + ".circle" + (fill ? ".fill" : ""))

            case let .square(number, fill):
                // swiftlint:disable:next system_image_usage
                return Image(systemName: number.description + ".square" + (fill ? ".fill" : ""))
            }
        }
    }
}