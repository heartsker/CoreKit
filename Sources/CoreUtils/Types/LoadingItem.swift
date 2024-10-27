//
//  Created by Daniel Pustotin on 08.06.2023.
//

import Foundation
import RxSweet

final public class LoadingItem<T>: ObservableObject {
    // MARK: - Public properties

    @PublishedRelay public private(set) var isLoaded: Bool
    @PublishedRelay public private(set) var loadedItem: T?

    public var asUnloaded: LoadingItem<T> {
        let copy = self
        copy.isLoaded = false
        return copy
    }

    // MARK: - Constructor

    public init(loadingTask: @escaping AsyncThrowableEmitter<T?>) {
        isLoaded = false
        loadedItem = nil

        startLoading(loadingTask: loadingTask)
    }

    public init(loadedItem: T?) {
        self.isLoaded = true
        self.loadedItem = loadedItem
    }

    public init() {
        isLoaded = false
        loadedItem = nil
    }

    // MARK: - Public methods

    public func map<U>(transform: @escaping Mapper<T?, U>) -> Observable<U> {
        $loadedItem
            .map(transform)
    }

    public func whenLoaded(do task: @escaping AsyncThrowableApplicator<T>) {
        if !ifLoaded(do: { item in
            Task { @MainActor in
                try await task(item)
            }
        }) {
            Task { @MainActor [weak self] in
                self?.onLoadingFinishedTasks.append(task)
            }
        }
    }

    public func reload(loadingTask: @escaping AsyncThrowableEmitter<T?>) {
        self.isLoaded = false
        self.loadedItem = nil

        startLoading(loadingTask: loadingTask)
    }

    @discardableResult
    public func ifLoaded(do task: Applicator<T>?) -> Bool {
        if let loadedItem {
            task?(loadedItem)
        }
        return isLoaded
    }

    @discardableResult
    public func ifLoaded(do task: Applicator<LoadingItem>?) -> Bool {
        if isLoaded {
            task?(self)
        }
        return isLoaded
    }

    // MARK: - Private methods

    private func startLoading(loadingTask: @escaping AsyncThrowableEmitter<T?>) {
        Task {
            let item = try await Task {
                try await loadingTask()
            }.value

            Task { @MainActor in
                if let item {
                    loaded(item)
                }
            }
        }
    }

    @MainActor
    private func loaded(_ item: T) {
        self.loadedItem = item
        self.isLoaded = true

        Task {
            await performOnLoadingFinishedTasks(with: item)
        }
    }

    @MainActor
    private func performOnLoadingFinishedTasks(with loadedItem: T) async {
        await withThrowingTaskGroup(of: Void.self) { [weak self] taskGroup in
            guard let tasks = self?.onLoadingFinishedTasks,
                  !tasks.isEmpty else {
                return
            }
            for task in tasks {
                taskGroup.addTask {
                    try await task(loadedItem)
                }
            }
        }

        Task { @MainActor in
            onLoadingFinishedTasks.removeAll()
        }
    }

    // MARK: - Private properties

    private let uniqueID = UUID()

    @MainActor private var onLoadingFinishedTasks: [AsyncThrowableApplicator<T>] = []
}

extension LoadingItem: Identifiable where T: Identifiable, T.ID == UID {
    public var id: T.ID {
        loadedItem?.id ?? T.ID(describing: uniqueID)
    }
}

extension LoadingItem: Equatable where T: Identifiable, T.ID == UID {
    public static func == (lhs: LoadingItem<T>, rhs: LoadingItem<T>) -> Bool {
        lhs.id == rhs.id
    }
}
