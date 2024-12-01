//
//  Created by Daniel Pustotin on 14.08.2022.
//

/// A protocol for objects that have a unique key
public protocol UniqueKeyStoring: CodingKey {
    /// A unique key for the object
    var key: String { get }

    /// A unique id for the object
    static var uid: String { get }
}

// MARK: - Default implementation

public extension UniqueKeyStoring {
    /// A unique key for the object
    var key: String {
        Self.uid + String(describing: self)
    }
}
