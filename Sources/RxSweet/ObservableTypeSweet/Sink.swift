//
//  Created by Daniel Pustotin on 14.08.2023.
//

public extension ObservableType {
    func sink(
        onNext: @escaping (Element) -> Void,
        onError: ((Error) -> Void)? = nil,
        onCompleted: (() -> Void)? = nil,
        onDisposed: (() -> Void)? = nil
    ) -> Disposable {
        subscribe(
            onNext: onNext,
            onError: onError,
            onCompleted: onCompleted,
            onDisposed: onDisposed
        )
    }

    func sink(
        onNext: @escaping () throws -> Void,
        onError: ((Error) -> Void)? = nil,
        onCompleted: (() -> Void)? = nil,
        onDisposed: (() -> Void)? = nil
    ) -> Disposable {
        sink(
            onNext: { _ in try? onNext() },
            onError: onError,
            onCompleted: onCompleted,
            onDisposed: onDisposed
        )
    }
}
