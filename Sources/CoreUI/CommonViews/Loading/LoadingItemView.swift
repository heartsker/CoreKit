//
//  Created by Daniel Pustotin on 08.06.2023.
//

import CoreTypes
import SwiftUI

public struct LoadingItemView<T, Content: View>: View {
    // MARK: - Constructor

    public init(
        _ loadingItem: LoadingItem<T>,
        @ViewBuilder content: @escaping Mapper<T, Content>
    ) {
        self.loadingItem = loadingItem
        self.content = content
    }

    // MARK: - Body

    public var body: some View {
        if let item = loadingItem.loadedItem {
            content(item)
        }
    }

    // MARK: - Private properties

    private let loadingItem: LoadingItem<T>
    private let content: Mapper<T, Content>
}
