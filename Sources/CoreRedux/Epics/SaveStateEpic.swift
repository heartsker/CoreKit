//
//  Created by Daniel Pustotin on 25.12.2024
//

import Combine
import CoreUtils

struct SaveAppStateAction: ActionRepresentable {}

final public class SaveStateEpic: Epic {
    private let storage: Storage<SingleValueCodingKeys>
    private let isTriggerAction: Mapper<any ActionRepresentable, Bool>

    public init(
        storage: Storage<SingleValueCodingKeys>,
        isTriggerAction: @escaping SendableMapper<any ActionRepresentable, Bool>
    ) {
        self.storage = storage
        self.isTriggerAction = isTriggerAction
    }

    override public func act(
        actions: AnyPublisher<any ActionRepresentable, Never>
    ) -> AnyPublisher<any ActionRepresentable, Never> {
        actions
            .filter(isTriggerAction)
            .map { _ in SaveAppStateAction() }
            .eraseToAnyPublisher()
    }
}
