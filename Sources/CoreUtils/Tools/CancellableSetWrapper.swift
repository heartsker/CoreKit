//
//  Created by Daniel Pustotin on 25.12.2024
//

import Combine

public final class CancellableSetWrapper {
    public var cancellables = Set<AnyCancellable>()

    public init() {}
}
