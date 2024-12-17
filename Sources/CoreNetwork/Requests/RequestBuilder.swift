//
//  Created by Daniel Pustotin on 23.04.2024.
//

final class RequestBuilder {
    // MARK: - Constructor

    private init(backendRequest: BackendRequest) {
        self.backendRequest = backendRequest
    }

    // MARK: - Public methods

    static func createRequest(to endpoint: any Endpoint) -> RequestBuilder {
        RequestBuilder(
            backendRequest: BackendRequest(endpoint: endpoint)
        )
    }

    @discardableResult
    func with(method: HttpMethod) -> RequestBuilder {
        backendRequest = backendRequest.copy(method: method)
        return self
    }

    @discardableResult
    func with(data: RequestDataRepresentable?) -> RequestBuilder {
        backendRequest = backendRequest.copy(data: data)
        return self
    }

    @discardableResult
    func with(contentType: RequestContentType) -> RequestBuilder {
        backendRequest = backendRequest.copy(contentType: contentType)
        return self
    }

    @discardableResult
    func with(queryItem name: String, value: CustomStringConvertible?) -> RequestBuilder {
        var queryItems = backendRequest.queryItems
        queryItems.append(
            URLQueryItem(name: name, value: value?.description)
        )
        backendRequest = backendRequest.copy(queryItems: queryItems)
        return self
    }

    @discardableResult
    func with(queryItems: [URLQueryItem]) -> RequestBuilder {
        backendRequest = backendRequest.copy(queryItems: queryItems)
        return self
    }

    @discardableResult
    func with(header: String, value: String) -> RequestBuilder {
        var headers = backendRequest.headers
        headers[header] = value
        backendRequest = backendRequest.copy(headers: headers)
        return self
    }

    @discardableResult
    func with(headers: [String: String]) -> RequestBuilder {
        backendRequest = backendRequest.copy(headers: headers)
        return self
    }

    @discardableResult
    func with(timeout: TimeInterval) -> RequestBuilder {
        backendRequest = backendRequest.copy(timeout: timeout)
        return self
    }

    @discardableResult
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
        return self
    }

    func build() -> BackendRequest {
        backendRequest
    }

    // MARK: - Private properties

    private var backendRequest: BackendRequest
}
