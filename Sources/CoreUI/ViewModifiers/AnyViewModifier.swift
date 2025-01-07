//
//  Created by Daniel Pustotin on 28.05.2022.
//

import SwiftUI

public extension View {
    // MARK: - Public properties

    /// `AnyView` from `View`
    @MainActor var anyView: AnyView {
        AnyView(self)
    }
}
