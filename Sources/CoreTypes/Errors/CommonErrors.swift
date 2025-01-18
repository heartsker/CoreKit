//
//  Created by Daniel Pustotin on 18.10.2023.
//

public enum CommonErrors: CommonError {
    case prohibitedBaseClassMethodCall(Any.Type)
    case unavailablePropertyUsage(property: String, class: Any.Type)
    case notImplemented
    case weakReferenceDeallocated

    public var errorDescription: String {
        switch self {
        case .prohibitedBaseClassMethodCall(let anyClass):
            "Base class method must be overridden in \(anyClass)"
        case let .unavailablePropertyUsage(property, anyClass):
            "Property \(property) is unavailable in \(anyClass)"
        case .notImplemented:
            "This functionality is not implemented"
        case .weakReferenceDeallocated:
            "Weak reference was deallocated"
        }
    }
}
