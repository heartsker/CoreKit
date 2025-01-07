//
//  Created by Daniel Pustotin on 10.06.2023.
//

import SwiftUI

private struct LoadingShimmerViewModifier: ViewModifier {
    // MARK: - Constructor

    init(isLoading: Bool) {
        self.isLoading = isLoading
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .redacted(reason: isLoading ? .placeholder : [])
            .shimmering(when: isLoading)
    }

    // MARK: - Private properties

    private let isLoading: Bool
}

public extension View {
    /// Applies loading shimmer view modifier to the view
    /// - Parameters:
    ///   - isLoading: Weather or not the redacted mode and shimmer should be applied
    /// - Returns: Modified view
    func loadingShimmer(when isLoading: Bool = true) -> some View {
        modifier(LoadingShimmerViewModifier(isLoading: isLoading))
    }
}
