//
//  Created by Daniel Pustotin on 15.06.2022.
//

final public class LoaderImpl: Loader {
    // MARK: - Properties

    private let backendRequester: BackendRequestExecuting

    // MARK: - Constructor

    public init(backendRequester: BackendRequestExecuting) {
        self.backendRequester = backendRequester
    }

    // MARK: - Methods

    public func load<T>(
        type: T.Type,
        request: BackendRequest
    ) async throws -> T? where T: Loadable {
        let result = try await backendRequester.execute(request: request)

        switch result {
        case .success(let data):
            if T.self is Data.Type {
                guard let data = data as? T else {
                    throw NeverError()
                }
                return data
            }

            if data.isEmpty {
                return nil
            }

            return try JSONDecoder.snakeCaseDecoder.decode(T.self, from: data)

        case .failure(let error):
            throw error
        }
    }
}
