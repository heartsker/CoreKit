//
//  Created by Daniel Pustotin on 26.12.2024
//

import Combine
import CoreUtils

public final class RestoreStateEpic<State: StateRepresentable, TriggerAction: ActionRepresentable>: Epic {
    private let storage: Storage<SingleValueCodingKeys>
    private let stateType: State.Type
    private let triggerAction: TriggerAction
    private let restoreStateAction: Mapper<State, any ActionRepresentable>

    public init(
        storage: Storage<SingleValueCodingKeys>,
        stateType: State.Type,
        triggerAction: TriggerAction,
        restoreStateAction: @escaping Mapper<State, any ActionRepresentable>
    ) {
        self.storage = storage
        self.stateType = stateType
        self.triggerAction = triggerAction
        self.restoreStateAction = restoreStateAction
    }

    public override func act(
        actions: AnyPublisher<any ActionRepresentable, Never>
    ) -> AnyPublisher<any ActionRepresentable, Never> {
        actions
            .compactMap { $0 as? TriggerAction }
            .filter { [weak self] in $0 == self?.triggerAction }
            .compactMap { [weak self] _ in
                guard let self, let state = storage.value(for: .value, type: stateType) else { return nil }
                return restoreStateAction(state)
            }
            .eraseToAnyPublisher()
    }
}
