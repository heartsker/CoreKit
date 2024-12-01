//
//  Created by Daniel Pustotin on 30.10.2024
//

public protocol Action {}

enum ReduxAction: Action {
    case initialize
}

enum LifecycleAction: Action {
    case appLaunched
    case appWillBeTerminated
}
