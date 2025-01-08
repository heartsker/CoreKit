//
//  Created by Daniel Pustotin on 11.03.2023.
//

import Foundation

/// Builds and executes backend requests
public protocol BackendRequestExecuting: Sendable {
    @discardableResult
    func execute(
        request: BackendRequest
    ) async throws -> Data
}

final public class BackendRequestExecutor: BackendRequestExecuting {
    // MARK: - Properties

    private let urlSession: URLSession

    // MARK: - Constructor

    public init() {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(
            memoryCapacity: Const.memoryCacheSize,
            diskCapacity: Const.diskCacheSize
        )
        urlSession = URLSession(configuration: configuration)
    }

    // MARK: - Methods

    public func execute(request: BackendRequest) async throws -> Data {
        let (urlRequest, data) = try request.buildURLRequest()

        let result = await Task<Data, Error>.retrying(
            retryStrategy: request.retriesStrategy
        ) { [weak self] in
            guard let self else {
                throw BackendRequesterError.unknown
            }
            let (data, response) = try await execute(urlRequest, data: data)

            guard response.isSuccessfulStatusCode else {
                throw BackendRequesterError.badResponseStatusCode(response.httpStatusCode)
            }

            return data
        }.result

        return switch result {
        case .success(let data): data
        case .failure(let error): throw error
        }
    }

    private func execute(
        _ request: URLRequest,
        data: Data? = nil
    ) async throws -> (data: Data, response: URLResponse) {
        if let data {
            try await urlSession.upload(for: request, from: data)
        } else {
            try await urlSession.data(for: request)
        }
    }
}

// MARK: - Constants

private extension BackendRequestExecutor {
    enum Const {
        /// Memory cache size (16MB)
        static let memoryCacheSize = 16 * 1024 * 1024
        /// Disk cache size (150MB)
        static let diskCacheSize = 150 * 1024 * 1024
    }
}
