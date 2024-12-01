//
//  Created by Daniel Pustotin on 04.06.2024
//

import SwiftUI

/// Protocol for graphics color palette
public protocol GraphicsColorPalette {
    /// Primary graphics color
    static var graphicsPrimary: Color { get }
    /// Secondary graphics color
    static var graphicsSecondary: Color { get }
}
