//
//  Created by Daniel Pustotin on 30.10.2024
//

public protocol Middleware {
    func interfere(store: any StoreRepresentable, next: @escaping Dispatch) -> Dispatch
}
