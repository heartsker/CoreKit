//
//  Created by Daniel Pustotin on 30.10.2024
//

public protocol ActionRepresentable {}

enum ReduxAction: ActionRepresentable {
    case initialize
}

enum LifecycleAction: ActionRepresentable {
    case appLaunched
    case appWillBeTerminated
}
