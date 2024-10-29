//
//  Created by Daniel Pustotin on 19.07.2024
//

public protocol ObjectLoadedEventSender {
    /// Sends ``ObjectLoadedEvent``
    /// - Parameters:
    ///  - object: loaded object
    ///  - source: loading source
    func objectLoaded(
        object: Loggable,
        source: ObjectLoadedEvent.Source
    )
}

extension Analytics: ObjectLoadedEventSender {
    public func objectLoaded(
        object: Loggable,
        source: ObjectLoadedEvent.Source
    ) {
        let event = ObjectLoadedEvent(
            object: object.logDescription,
            source: source
        )
        send(event)
    }
}
