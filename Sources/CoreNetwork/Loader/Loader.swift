//
//  Created by Daniel Pustotin on 24.04.2024.
//

public typealias Loadable = Codable & Loggable

public protocol Loader {
    func load<T>(
        type: T.Type,
        request: BackendRequest
    ) async throws -> T? where T: Loadable

    func loadExisting<T>(
        type: T.Type,
        request: BackendRequest
    ) async throws -> T where T: Loadable
}
