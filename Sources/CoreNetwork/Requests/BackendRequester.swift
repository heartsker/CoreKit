//
//  Created by Daniel Pustotin on 03.01.2025
//

import Foundation

open class BackendRequester: @unchecked Sendable {
    // MARK: - Properties

    private let backendRequestExecutor: BackendRequestExecuting

    // MARK: - Constructor

    public init(backendRequestExecutor: BackendRequestExecuting) {
        self.backendRequestExecutor = backendRequestExecutor
    }

    // MARK: - Methods

    public func request(_ requestBuilder: RequestBuilder) async throws -> Data {
        try await backendRequestExecutor.execute(request: requestBuilder.build())
    }

    public func request<T: Codable>(_ requestBuilder: RequestBuilder, schema: T.Type) async throws  -> T {
        let data = try await backendRequestExecutor.execute(request: requestBuilder.build())

        guard let object = try? JSONDecoder.snakeCaseDecoder.decode(schema, from: data) else {
            throw BackendRequesterError.failedToDecodeSchema(schema)
        }
        return object
    }

    public func request(endpoint: Endpoint) async throws -> Data {
        try await request(RequestBuilder.createRequest(to: endpoint))
    }

    public func request<T: Codable>(endpoint: Endpoint, schema: T.Type) async throws -> T {
        try await request(RequestBuilder.createRequest(to: endpoint), schema: schema)
    }
}
