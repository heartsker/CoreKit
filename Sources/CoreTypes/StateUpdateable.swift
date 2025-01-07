//
//  Created by Daniel Pustotin on 25.12.2024
//

public protocol StateUpdatable {
    mutating func updateState(with state: Self)
}

public extension StateUpdatable {
    mutating func updateState(with state: Self?) {
        guard let state = state else { return }
        updateState(with: state)
    }
}
