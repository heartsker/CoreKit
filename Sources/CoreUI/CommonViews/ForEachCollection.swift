//
//  Created by Daniel Pustotin on 21.06.2023.
//

import CoreTypes
import SwiftUI

public struct ForEachCollection<Data, Content: View>: View where Data: RandomAccessCollection, Data.Index: Hashable {
    // MARK: - Constructor

    public init(_ collection: Data, @ViewBuilder content: @escaping Mapper<Data.Element, Content>) {
        self.collection = collection
        self.content = content
    }

    // MARK: - Body

    public var body: some View {
        ForEach(collection.indices, id: \.self) { index in
            content(collection[index])
        }
    }

    // MARK: - Private properties

    private var collection: Data
    private let content: Mapper<Data.Element, Content>
}
