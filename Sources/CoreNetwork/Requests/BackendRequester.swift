//
//  Created by Daniel Pustotin on 03.01.2025
//

open class BackendRequester {
    // MARK: - Properties

    private let backendRequestExecutor: BackendRequestExecuting

    // MARK: - Constructor

    public init(backendRequestExecutor: BackendRequestExecuting) {
        self.backendRequestExecutor = backendRequestExecutor
    }

    // MARK: - Methods

    public func request(_ requestBuilder: RequestBuilder) async -> GenericResult<Data> {
        try {
            backendRequestExecutor.execute(request: requestBuilder.build())
        } catch {
            .failure(error)
        }
    }

    public func request<T: Codable>(_ request: BackendRequest, schema: T.Type) async -> GenericResult<T> {
        try {
            guard case .success(let data) = try await backendRequestExecutor.execute(request: request) else {
                return result
            }

            guard let object = try? JSONDecoder.snakeCaseDecoder.decode(schema, from: data) else {
                return .failure(BackendRequesterError.failedToDecodeSchema(schema))
            }

            return .success(object)
        } catch {
            return .failure(error)
        }
    }

    public func request(endpoint: Endpoint) async -> GenericResult<Data> {
        request(RequestBuilder.createRequest(to: endpoint))
    }

    public func request<T: Codable>(endpoint: Endpoint, schema: T.Type) async -> GenericResult<T> {
        request(RequestBuilder.createRequest(to: endpoint), schema: schema)
    }
}
