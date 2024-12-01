//
//  Created by Daniel Pustotin on 09.06.2023.
//

import SwiftUI

// swiftlint:disable:next swiftui_views_naming
public struct LoadingImage: View {
    // MARK: - Constructor

    public init(_ loadingImage: Image?) {
        self.loadingImage = loadingImage
    }

    public init() {
        self.loadingImage = nil
    }

    // MARK: - Body
    public var body: some View {
        (loadingImage ?? Image())
            .resizable()
            .loadingShimmer(when: loadingImage == nil)
    }

    // MARK: - Private properties

    private let loadingImage: Image?
}
