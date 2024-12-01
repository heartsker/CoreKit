//
//  Created by Daniel Pustotin on 12.09.2022.
//

import SwiftUI

/// Brand color palette
public protocol BrandColorPalette {
    static var brandAccent: Color { get }
    static var brandGradient: Gradient { get }
    static var brandGradientSecondary: Gradient { get }
}
