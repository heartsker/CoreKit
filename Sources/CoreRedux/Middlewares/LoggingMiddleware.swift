//
//  Created by Daniel Pustotin on 29.10.2024
//

class LoggingMiddleware: Middleware {
    func interfere(store: any StoreRepresentable, next: @escaping Dispatch) -> Dispatch {
        { action in
            next(action)
            logger.debug("Action: \(action)")
            logger.debug("State: \(store.state)")
        }
    }
}
