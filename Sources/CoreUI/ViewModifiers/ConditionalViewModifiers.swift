//
//  Created by Daniel Pustotin on 01.06.2022.
//

import SwiftUI

public extension View {
    // MARK: - Public methods

    /// Transforms view if condition is satisfied
    @ViewBuilder
    func when<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

public extension Text {
    // MARK: - Public methods

    /// Transforms text view if condition is satisfied
    func when(_ condition: Bool, transform: (Self) -> Text) -> Text {
        if condition {
            return transform(self)
        } else {
            return self
        }
    }
}
