//
//  Created by Daniel Pustotin on 18.01.2025
//

import SwiftUI

private struct LoadingViewModifier: ViewModifier {
    // MARK: - Properties

    private let isLoading: Bool

    // MARK: - Constructor

    init(isLoading: Bool) {
        self.isLoading = isLoading
    }

    // MARK: - Methods

    func body(content: Content) -> some View {
        if isLoading {
            ProgressView()
        } else {
            content
        }
    }
}

public extension View {
    /// Shows loading indicator while loading
    func loading(_ isLoading: Bool) -> some View {
        modifier(LoadingViewModifier(isLoading: isLoading))
    }
}
