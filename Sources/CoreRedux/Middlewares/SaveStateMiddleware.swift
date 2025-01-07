//
//  Created by Daniel Pustotin on 26.12.2024
//

import CoreUtils

final public class SaveStateMiddleware: Middleware {
    private let storage: Storage<SingleValueCodingKeys>

    public init(storage: Storage<SingleValueCodingKeys>) {
        self.storage = storage
    }

    public func interfere(store: any StoreRepresentable, next: @escaping Dispatch) -> Dispatch {
        { [weak self] action in
            next(action)

            guard action is SaveAppStateAction else { return }

            self?.storage.set(value: store.state, for: .value)
        }
    }
}
