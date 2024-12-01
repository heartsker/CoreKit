//
//  Created by Daniel Pustotin on 30.10.2024
//

public protocol Middleware {
    func interfere(store: any StoreProtocol, next: @escaping Dispatch) -> Dispatch
}
