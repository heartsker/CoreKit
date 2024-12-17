//
//  Created by Daniel Pustotin on 28.05.2022.
//

import SwiftUI

public extension Array where Element: View {
    // MARK: - Public properties

    /// Array of `AnyView` from array of `View`
    var anyView: [AnyView] {
        map { view in
            AnyView(view)
        }
    }
}

public extension View {
    // MARK: - Public properties

    /// `AnyView` from `View`
    @MainActor
    var anyView: AnyView {
        AnyView(self)
    }
}
