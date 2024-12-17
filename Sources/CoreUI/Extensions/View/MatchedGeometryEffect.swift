//
//  Created by Daniel Pustotin on 20.07.2022.
//

import CoreTypes
import SwiftUI

private struct MatchedGeometryEffect<ID: Hashable>: ViewModifier {
    // MARK: - Constructor

    init(id: ID, ns: Namespace.ID, isSource: Bool) {
        self.id = id
        self.ns = ns
        self.isSource = isSource
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .matchedGeometryEffect(
                id: id,
                in: ns,
                isSource: isSource
            )
    }

    // MARK: - Private properties

    private let id: ID
    private let ns: Namespace.ID
    private let isSource: Bool
}

public extension View {
    // MARK: - Public methods

    /// Matches the geometry of the view with the specified id and for specified object
    /// - Parameters:
    ///   - id: Unique ID
    ///   - object: Identifiable object with `id` property of type `UID`
    ///   - ns: Namespace to match in
    ///   - isSource: Is the view a source of the geometry or not
    /// - Returns: Modified view
    func match<T: Identifiable>(
        _ id: UID,
        of object: T,
        in ns: Namespace.ID,
        isSource: Bool = true
    ) -> some View where T.ID == UID {
        match(.dashSeparated(id, UID(object: object)), in: ns, isSource: isSource)
    }

    /// Matches the geometry of the view with the specified id
    /// - Parameters:
    ///   - id: Unique ID
    ///   - ns: Namespace to match in
    ///   - isSource: Is the view a source of the geometry or not
    func match(
        _ id: UID,
        in ns: Namespace.ID,
        isSource: Bool = true
    ) -> some View {
        matchedGeometryEffect(id: id, in: ns, isSource: isSource)
    }
}
