//
//  Created by Daniel Pustotin on 30.10.2024
//

import Combine

public protocol StateProvider: AnyObject {
    associatedtype State: StateRepresentable
    var state: State { get }
    func states() -> AnyPublisher<State, Never>
}
