//
//  Created by Daniel Pustotin on 19.07.2024
//

public struct ObjectLoadedEvent: AnalyticsEvent {
    public enum Source: String {
        case web
        case storage
    }

    let object: String
    let source: Source

    public let name = "object_loaded"
    public var parameters: JSON {
        [
            "object": object,
            "source": source.rawValue
        ]
    }
}
