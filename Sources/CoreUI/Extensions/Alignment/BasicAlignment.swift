//
//  Created by Daniel Pustotin on 16.09.2023.
//

import SwiftUI

public enum BasicAlignment {
    case top
    case bottom
    case leading
    case trailing
    case center

    public var isVertical: Bool {
        self == .top || self == .center || self == .bottom
    }

    public var isHorizontal: Bool {
        self == .leading || self == .center || self == .trailing
    }
}

public extension Alignment {
    var basic: BasicAlignment {
        switch self {
        case .top, .topLeading, .topTrailing:
            return .top

        case .bottom, .bottomLeading, .bottomTrailing:
            return .bottom

        case .leading, .leadingFirstTextBaseline, .leadingLastTextBaseline:
            return .leading

        case .trailing, .trailingFirstTextBaseline, .trailingLastTextBaseline:
            return .trailing

        default:
            return .center
        }
    }
}
