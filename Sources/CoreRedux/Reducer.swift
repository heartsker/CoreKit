//
//  Created by Daniel Pustotin on 30.10.2024
//

public protocol ReducerRepresentable {
    associatedtype State: StateRepresentable
    func reduce(_ state: inout State, action: any ActionRepresentable)
}
