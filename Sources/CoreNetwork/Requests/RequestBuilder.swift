//
//  Created by Daniel Pustotin on 23.04.2024.
//

import Foundation

public final class RequestBuilder {
    // MARK: - Constructor

    private init(backendRequest: BackendRequest) {
        self.backendRequest = backendRequest
    }

    // MARK: - Public methods

    public static func createRequest(to endpoint: any Endpoint) -> RequestBuilder {
        RequestBuilder(backendRequest: BackendRequest(endpoint: endpoint))
    }

    @discardableResult
    public func with(method: HttpMethod) -> RequestBuilder {
        backendRequest = backendRequest.copy(method: method)
        return self
    }

    @discardableResult
    public func with(data: RequestDataRepresentable?) -> RequestBuilder {
        backendRequest = backendRequest.copy(data: data)
        return self
    }

    @discardableResult
    public func with(contentType: RequestContentType) -> RequestBuilder {
        backendRequest = backendRequest.copy(contentType: contentType)
        return self
    }

    @discardableResult
    public func with(cachePolicy: CachePolicy) -> RequestBuilder {
        backendRequest = backendRequest.copy(cachePolicy: cachePolicy)
        return self
    }

    @discardableResult
    public func with(queryItem name: String, value: CustomStringConvertible?) -> RequestBuilder {
        var queryItems = backendRequest.queryItems
        queryItems.append(
            URLQueryItem(name: name, value: value?.description)
        )
        backendRequest = backendRequest.copy(queryItems: queryItems)
        return self
    }

    @discardableResult
    public func with(queryItems: [URLQueryItem]) -> RequestBuilder {
        backendRequest = backendRequest.copy(queryItems: queryItems)
        return self
    }

    @discardableResult
    public func with(header: String, value: String) -> RequestBuilder {
        var headers = backendRequest.headers
        headers[header] = value
        backendRequest = backendRequest.copy(headers: headers)
        return self
    }

    @discardableResult
    public func with(headers: [String: String]) -> RequestBuilder {
        backendRequest = backendRequest.copy(headers: headers)
        return self
    }

    @discardableResult
    public func with(timeout: TimeInterval) -> RequestBuilder {
        backendRequest = backendRequest.copy(timeout: timeout)
        return self
    }

    @discardableResult
    public func with(retriesStrategy: RetryStrategy) -> RequestBuilder {
        backendRequest = backendRequest.copy(retriesStrategy: retriesStrategy)
        return self
    }

    func build() -> BackendRequest {
        backendRequest
    }

    // MARK: - Private properties

    private var backendRequest: BackendRequest
}
