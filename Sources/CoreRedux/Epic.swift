//
//  Created by Daniel Pustotin on 30.10.2024
//

import Combine

struct Connect: Action {}

public class Epic {
    public func act(actions: AnyPublisher<Action, Never>) -> AnyPublisher<Action, Never> {
        fatalError("Subclasses must implement 'act(actions:)'")
    }

    func actInternal(actions: AnyPublisher<Action, Never>) -> AnyPublisher<Action, Never> {
        return actions
            .filter({ $0 is Connect })
            .first()
            .flatMap { _ in self.act(actions: actions) }
            .eraseToAnyPublisher()
    }
}
