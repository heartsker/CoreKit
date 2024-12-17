//
//  Created by Daniel Pustotin on 30.10.2024
//

import Combine

struct Connect: ActionRepresentable {}

public class Epic {
    public func act(actions: AnyPublisher<ActionRepresentable, Never>) -> AnyPublisher<ActionRepresentable, Never> {
        fatalError("Subclasses must implement 'act(actions:)'")
    }

    func actInternal(actions: AnyPublisher<ActionRepresentable, Never>) -> AnyPublisher<ActionRepresentable, Never> {
        return actions
            .filter({ $0 is Connect })
            .first()
            .flatMap { _ in self.act(actions: actions) }
            .eraseToAnyPublisher()
    }
}
