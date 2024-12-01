//
//  Created by Daniel Pustotin on 08.06.2023.
//

import CommonUtils
import SwiftUI

// swiftlint:disable:next swiftui_views_naming
public struct LoadingText: View {
    // MARK: - Constructor

    public init(_ loadingString: String?, placeholder: LoadingTextPlaceholder) {
        self.loadingString = loadingString
        self.placeholder = placeholder
    }

    public init(placeholder: LoadingTextPlaceholder) {
        self.loadingString = nil
        self.placeholder = placeholder
    }

    // MARK: - Body
    public var body: some View {
        Text(loadingString ?? placeholder.sampleString)
            .loadingShimmer(when: loadingString == nil)
    }

    // MARK: - Private properties

    private let loadingString: String?
    private let placeholder: LoadingTextPlaceholder
}
