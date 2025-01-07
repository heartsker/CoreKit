//
//  Created by Daniel Pustotin on 30.10.2024
//

import Combine

open class Epic {
    public init() {}

    open func act(
        actions: AnyPublisher<any ActionRepresentable, Never>
    ) -> AnyPublisher<any ActionRepresentable, Never> {
        fatalError("Subclasses must implement 'act(actions:)'")
    }

    final func actInternal(
        actions: AnyPublisher<any ActionRepresentable, Never>
    ) -> AnyPublisher<any ActionRepresentable, Never> {
        actions
            .filter({ $0 is EpicConnectAction })
            .first()
            .flatMap { _ in self.act(actions: actions) }
            .eraseToAnyPublisher()
    }
}
