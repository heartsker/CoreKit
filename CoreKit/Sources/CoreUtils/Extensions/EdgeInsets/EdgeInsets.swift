//
//  Created by Daniel Pustotin on 23.10.2022.
//

import SwiftUI

public extension EdgeInsets {
    // MARK: - Constructor

    /// Creates an `EdgeInsets` instance by specifying the top and bottom insets
    /// - Parameters:
    ///   - top: Top inset
    ///   - bottom: Bottom inset
    init(top: CGFloat, bottom: CGFloat) {
        self.init(top: top, leading: .zero, bottom: bottom, trailing: .zero)
    }
}
