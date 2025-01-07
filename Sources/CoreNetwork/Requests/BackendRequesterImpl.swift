//
//  Created by Daniel Pustotin on 11.03.2023.
//

import Foundation

/// Builds and executes backend requests
public protocol BackendRequester {
    @discardableResult
    func execute(
        request: BackendRequest,
        mockResponseData: Data?
    ) async throws -> GenericResult<Data>
}

final public class BackendRequesterImpl: NSObject, BackendRequester, URLSessionDelegate {
    // MARK: - Constructor

    public init(
        experimentsProvider: BackendRequesterExperimentsProvider,
        offlineModeProvider: OfflineModeProvider,
        authSessionHolder: AuthSessionHolder
    ) {
        self.experimentsProvider = experimentsProvider
        self.offlineModeProvider = offlineModeProvider
        self.authSessionHolder = authSessionHolder
    }

    // MARK: - Public methods

    public func execute(
        request: BackendRequest,
        mockResponseData: Data?
    ) async throws -> GenericResult<Data> {
        if experimentsProvider.slowNetworkRequests {
            try await Task<Never, Never>.sleep(for: .seconds(1))
        }

        if offlineModeProvider.isOfflineMode, let mockResponseData {
            return .success(mockResponseData)
        }

        let (urlRequest, data) = try await enrichWithSession(request)

        return await Task<Data, Error>.retrying(
            retryStrategy: request.retriesStrategy
        ) { [weak self] in
            do {
                guard let self else {
                    throw BackendRequesterError.unknown
                }
                let (data, response) = try await execute(
                    urlRequest,
                    data: data
                )

                guard response.isSuccessfulStatusCode else {
                    throw BackendRequesterError.badResponseStatusCode(response.httpStatusCode)
                }

                return data
            } catch {
                logger.critical("Request failed", error: error)
                logger.debug(request)
                logger.debug(urlRequest)
                throw error
            }
        }.result
    }

    // MARK: - Private methods

    private func enrichWithSession(_ request: BackendRequest) async throws -> (URLRequest, Data?) {
        var (urlRequest, data) = try request.buildURLRequest()

        if request.attachSession {
            guard let token = request.explicitSession?.token ?? authSessionHolder.session?.token else {
                throw BackendRequesterError.noSession
            }

            let sessionToken = experimentsProvider.useTestSessionToken
                ? TestSessionTokenProvider.token
                : token

            urlRequest.url?.append(
                queryItems: [
                    URLQueryItem(
                        name: "session_token",
                        value: sessionToken
                    )
                ]
            )
        }

        return (urlRequest, data)
    }

    private func execute(
        _ request: URLRequest,
        data: Data? = nil
    ) async throws -> (data: Data, response: URLResponse) {
        if let data {
            return try await URLSession.shared.upload(for: request, from: data)
        } else {
            return try await URLSession.shared.data(for: request)
        }
    }

    // MARK: - Private properties

    private let experimentsProvider: BackendRequesterExperimentsProvider
    private let offlineModeProvider: OfflineModeProvider
    private let authSessionHolder: AuthSessionHolder
}
