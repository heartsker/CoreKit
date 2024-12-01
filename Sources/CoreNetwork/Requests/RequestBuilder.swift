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
        backendRequest.apply { $0.method = method }
        return self
    }

    @discardableResult
    func with(data: Encodable?) -> RequestBuilder {
        backendRequest.apply { $0.data = data }
        return self
    }

    @discardableResult
    func with(contentType: RequestContentType) -> RequestBuilder {
        backendRequest.apply { $0.contentType = contentType }
        return self
    }

    @discardableResult
    func with(queryItem name: String, value: CustomStringConvertible?) -> RequestBuilder {
        backendRequest.apply { request in
            request.queryItems.append(
                URLQueryItem(name: name, value: value?.description)
            )
        }
        return self
    }

    @discardableResult
    func with(queryItems: [URLQueryItem]) -> RequestBuilder {
        backendRequest.apply { $0.queryItems = queryItems }
        return self
    }

    @discardableResult
    func with(header: String, value: String) -> RequestBuilder {
        backendRequest.apply { $0.headers[header] = value }
        return self
    }

    @discardableResult
    func with(headers: [String: String]) -> RequestBuilder {
        backendRequest.apply { $0.headers = headers }
        return self
    }

    @discardableResult
    func with(timeout: TimeInterval) -> RequestBuilder {
        backendRequest.apply { $0.timeout = timeout }
        return self
    }

    @discardableResult
    func with(attachSession: Bool) -> RequestBuilder {
        backendRequest.apply { $0.attachSession = attachSession }
        return self
    }

    @discardableResult
    func with(explicitSession: AuthSession) -> RequestBuilder {
        backendRequest.apply { $0.explicitSession = explicitSession }
        return self
    }

    @discardableResult
    func with(retriesStrategy: RetryStrategy) -> RequestBuilder {
        backendRequest.apply { $0.retriesStrategy = retriesStrategy }
        return self
    }

    func build() -> BackendRequest {
        backendRequest
    }

    // MARK: - Private properties

    private var backendRequest: BackendRequest
}
