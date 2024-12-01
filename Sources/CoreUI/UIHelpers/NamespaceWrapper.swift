//
//  Created by Daniel Pustotin on 28.11.2023.
//

import SwiftUI

public class NamespaceWrapper: ObservableObject {
    // MARK: - Public properties

    public let ns: Namespace.ID

    // MARK: - Constructor

    public init(namespace ns: Namespace.ID) {
        self.ns = ns
    }
}
