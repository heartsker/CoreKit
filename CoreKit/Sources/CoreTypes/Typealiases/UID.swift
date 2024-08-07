//
//  Created by Daniel Pustotin on 23.07.2022.
//

import Foundation

/// A type that represents an ID
public typealias UID = String

public extension UID {
    // MARK: - Public properties

    /// Unique id with 12 symbols
    static var unique: UID {
        UID(UUID().uuidString.suffix(12))
    }

    // MARK: - Constructor

    /// Creates new ``UID`` instance from an identifiable object
    /// - Parameter object: The object to extract id from
    init<T>(object: T) where T: Identifiable, T.ID == UID {
        self = object.id
    }

    // MARK: - Public methods

    /// ``UID`` instance, constructed by joining sequence, separating with `-`
    /// - Parameters:
    ///   - elements: The sequence to join into the `UID`
    /// - Returns: Created ``UID`` instance
    static func dashSeparated(_ elements: [String?]) -> UID {
        elements
            .compactMap { $0 }
            .joined(separator: "-")
    }

    /// ``UID`` instance, constructed by joining sequence, separating with `-`
    /// - Parameters:
    ///   - elements: The sequence to join into the `UID`
    /// - Returns: Created ``UID`` instance
    static func dashSeparated(_ elements: String?...) -> UID {
        dashSeparated(Array(elements))
    }
}

extension UID: Identifiable {
    public var id: Self {
        self
    }
}
