//
//  Created by Daniel Pustotin on 23.04.2024.
//

import Foundation

final class RequestBuilder {
    // MARK: - Constructor

    private init(backendRequest: BackendRequest) {
        self.backendRequest = backendRequest
    }

    // MARK: - Public methods

    public static func createRequest(to endpoint: any Endpoint) -> RequestBuilder {
        RequestBuilder(backendRequest: BackendRequest(endpoint: endpoint))
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(method: HttpMethod) -> RequestBuilder {
        backendRequest = backendRequest.copy(method: method)
=======
    public func with(method: HttpMethod) -> RequestBuilder {
        backendRequest.apply { $0.method = method }
>>>>>>> Stashed changes
        return self
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(data: RequestDataRepresentable?) -> RequestBuilder {
        backendRequest = backendRequest.copy(data: data)
=======
    public func with(data: Encodable?) -> RequestBuilder {
        backendRequest.apply { $0.data = data }
>>>>>>> Stashed changes
        return self
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(contentType: RequestContentType) -> RequestBuilder {
        backendRequest = backendRequest.copy(contentType: contentType)
=======
    public func with(contentType: RequestContentType) -> RequestBuilder {
        backendRequest.apply { $0.contentType = contentType }
>>>>>>> Stashed changes
        return self
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(queryItem name: String, value: CustomStringConvertible?) -> RequestBuilder {
        var queryItems = backendRequest.queryItems
        queryItems.append(
            URLQueryItem(name: name, value: value?.description)
        )
        backendRequest = backendRequest.copy(queryItems: queryItems)
=======
    public func with(cachePolicy: CachePolicy) -> RequestBuilder {
        backendRequest.apply { $0.cachePolicy = cachePolicy }
        return self
    }

    @discardableResult
    public func with(queryItem name: String, value: CustomStringConvertible?) -> RequestBuilder {
        backendRequest.apply { request in
            request.queryItems.append(
                URLQueryItem(name: name, value: value?.description)
            )
        }
>>>>>>> Stashed changes
        return self
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(queryItems: [URLQueryItem]) -> RequestBuilder {
        backendRequest = backendRequest.copy(queryItems: queryItems)
=======
    public func with(queryItems: [URLQueryItem]) -> RequestBuilder {
        backendRequest.apply { $0.queryItems = queryItems }
>>>>>>> Stashed changes
        return self
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(header: String, value: String) -> RequestBuilder {
        var headers = backendRequest.headers
        headers[header] = value
        backendRequest = backendRequest.copy(headers: headers)
=======
    public func with(header: String, value: String) -> RequestBuilder {
        backendRequest.apply { $0.headers[header] = value }
>>>>>>> Stashed changes
        return self
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(headers: [String: String]) -> RequestBuilder {
        backendRequest = backendRequest.copy(headers: headers)
=======
    public func with(headers: [String: String]) -> RequestBuilder {
        backendRequest.apply { $0.headers = headers }
>>>>>>> Stashed changes
        return self
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(timeout: TimeInterval) -> RequestBuilder {
        backendRequest = backendRequest.copy(timeout: timeout)
=======
    public func with(timeout: TimeInterval) -> RequestBuilder {
        backendRequest.apply { $0.timeout = timeout }
>>>>>>> Stashed changes
        return self
    }

    @discardableResult
<<<<<<< Updated upstream
    func with(attachSession: Bool) -> RequestBuilder {
        backendRequest = backendRequest.copy(attachSession: attachSession)
        return self
    }

    @discardableResult
    func with(explicitSession: AuthSession) -> RequestBuilder {
        backendRequest = backendRequest.copy(explicitSession: explicitSession)
        return self
    }

    @discardableResult
    func with(retriesStrategy: RetryStrategy) -> RequestBuilder {
        backendRequest = backendRequest.copy(retriesStrategy: retriesStrategy)
=======
    public func with(retriesStrategy: RetryStrategy) -> RequestBuilder {
        backendRequest.apply { $0.retriesStrategy = retriesStrategy }
>>>>>>> Stashed changes
        return self
    }

    func build() -> BackendRequest {
        backendRequest
    }

    // MARK: - Private properties

    private var backendRequest: BackendRequest
}
