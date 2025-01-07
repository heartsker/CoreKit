//
//  Created by Daniel Pustotin on 01.11.2024
//

import Foundation

open class Requester {
    private let backendRequester: BackendRequester

    public init(backendRequester: BackendRequester) {
        self.backendRequester = backendRequester
    }

    @discardableResult
    public final func execute(
        _ request: @autoclosure Emitter<BackendRequest>,
        with mockResponseData: Data? = nil
    ) async throws -> Data {
        let result = try await backendRequester.execute(request: request(), mockResponseData: mockResponseData)

        return switch result {
        case .success(let data): data
        case .failure(let error): throw error
        }
    }
}
