//
//  Created by Daniel Pustotin on 10.08.2023.
//

@preconcurrency import RxRelay
import SwiftUI

public extension BehaviorRelay {
    var binding: Binding<Element> {
        Binding {
            self.value
        } set: { [weak self] newValue in
            self?.accept(newValue)
        }
    }
}

public extension Binding {
    mutating func toRelay() -> BehaviorRelay<Value> {
        let relay = BehaviorRelay<Value>(value: wrappedValue)

        self = Binding(
            get: { relay.value },
            set: { relay.accept($0) }
        )

        return relay
    }
}
