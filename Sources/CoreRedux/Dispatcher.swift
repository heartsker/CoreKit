//
//  Created by Daniel Pustotin on 30.10.2024
//

public protocol Dispatcher: AnyObject {
    func dispatch(action: any ActionRepresentable)
}
