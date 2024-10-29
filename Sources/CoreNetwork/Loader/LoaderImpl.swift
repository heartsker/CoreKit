//
//  Created by Daniel Pustotin on 15.06.2022.
//

final public class LoaderImpl: Loader {
    // MARK: - Constructor

    public init(
        analytics: ObjectLoadedEventSender,
        experimentsProvider: LoaderExperimentsProvider,
        configuration: LoaderConfiguration,
        backendRequester: BackendRequester
    ) {
        self.analytics = analytics
        self.experimentsProvider = experimentsProvider
        self.configuration = configuration
        self.backendRequester = backendRequester
    }

    // MARK: - Public methods

    public func load<T>(
        type: T.Type,
        request: BackendRequest
    ) async throws -> T? where T: Loadable {
        // Try restoring saved data

        do {
            if let result = try await restoreSaved(T.self, for: request) {
                return result
            }
        } catch {
            logger.error("Failed to restore saved object", error: error)
        }

        // Load data from web

        let result = try await backendRequester.execute(request: request)

        switch result {
        case .success(let data):
            if T.self is Data.Type {
                try await saveRawDataIfNeeded(request: request, data: data)
                guard let data = data as? T else {
                    throw BackendRequesterError.unknown
                }
                return data
            }

            if data.isEmpty {
                return nil
            }

            let object = try JSONDecoder.snakeCaseDecoder.decode(T.self, from: data)
            analytics.objectLoaded(object: object, source: .web)
            logger.debug("Loaded from web - \(object.logDescription)")
            try await saveJSONDataIfNeeded(request: request, data: data)
            return object

        case .failure(let error):
            throw error
        }
    }

    public func loadExisting<T>(
        type: T.Type,
        request: BackendRequest
    ) async throws -> T where T: Loadable {
        guard let object = try await load(type: type, request: request) else {
            throw LoadingError.failed(type: type)
        }
        return object
    }

    // MARK: - Private methods

    private func restoreSaved<T>(
        _ type: T.Type,
        for request: BackendRequest
    ) async throws -> T? where T: Loadable {
        let filename = request.endpoint.url

        guard configuration.saveAndRestoreResponse,
              let savedTime = Self.storage.value(for: .file(filename), type: Date.self),
              Date().timeIntervalSince(savedTime) <= configuration.responseStoringTime else {
            // Should not restore saved data
            // According to the loading configuration
            // Or saved data was not found
            return nil
        }

        if type == Data.self,
           let result = try FileManager.shared.loadRawData(from: filename) as? T {
            analytics.objectLoaded(object: result, source: .storage)
            logger.debug("Loaded from storage - \(result.logDescription)")
            return result
        }

        let result = try FileManager.shared.load(T.self, from: filename)
        logger.debug("Loaded from storage - \(result.logDescription)")
        return result
    }

    private func saveRawDataIfNeeded(request: BackendRequest, data: Data) async throws {
        let filename = request.endpoint.url

        if configuration.saveAndRestoreResponse {
            do {
                try FileManager.shared.save(data: data, as: filename)
                Self.storage.set(value: Date(), for: .file(filename))
            } catch {
                logger.critical("Saving error occurred", error: error)
                logger.debug(request)
                logger.debug(data)
                throw error
            }
        }
    }

    private func saveJSONDataIfNeeded(request: BackendRequest, data: Data) async throws {
        let filename = request.endpoint.url

        if configuration.saveAndRestoreResponse {
            do {
                try FileManager.shared.save(data: data, as: filename)
                Self.storage.set(value: Date(), for: .file(filename))
            } catch {
                logger.critical("Saving error occurred", error: error)
                logger.debug(request)
                logger.debug(data)
                throw error
            }
        }
    }

    // MARK: - Private properties

    private let analytics: ObjectLoadedEventSender
    private let experimentsProvider: LoaderExperimentsProvider
    private let configuration: LoaderConfiguration
    private let backendRequester: BackendRequester

    // MARK: - Private type properties

    private static let storage = Storage(name: "loader", keys: StorageKeys.self)

    // MARK: - Private nesting

    private enum StorageKeys: CodingKey {
        case file(String)

        // MARK: - Public properties

        var stringValue: String {
            switch self {
            case .file(let filename):
                return filename
            }
        }

        var intValue: Int? {
            nil
        }

        // MARK: - Constructor

        init?(stringValue: String) {
            self = .file(stringValue)
        }

        init?(intValue: Int) {
            nil
        }
    }
}
