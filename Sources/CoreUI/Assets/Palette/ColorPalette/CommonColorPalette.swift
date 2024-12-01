//
//  Created by Daniel Pustotin on 16.01.2023.
//

import SwiftUI

/// Common color palette
public protocol CommonColorPalette {
    /// Error color
    static var commonError: Color { get }
    /// Error color (30%)
    static var commonError30: Color { get }
    /// Like color
    static var commonLike: Color { get }
    /// Shadow color
    static var commonShadow: Color { get }
    /// Success color
    static var commonSuccess: Color { get }

    /// Clear to black gradient
    static var commonClearToBlackGradient: Gradient { get }
}
