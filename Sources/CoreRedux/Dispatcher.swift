//
//  Created by Daniel Pustotin on 30.10.2024
//

import Combine

public protocol Dispatcher {
    func dispatch(action: Action)
}
