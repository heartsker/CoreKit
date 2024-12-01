//
//  Created by Daniel Pustotin on 14.08.2023.
//

import Combine
import RxSweet

@propertyWrapper
public struct PublishedRelay<Value> {
    // MARK: - Public properties

    @available(*, unavailable, message: "@Published is only available on properties of classes")
    public var wrappedValue: Value {
        get {
            preconditionFailure()
        }
        // swiftlint:disable:next unused_setter_value
        set {
            preconditionFailure()
        }
    }

    public var projectedValue: BehaviorRelay<Value> {
        relay
    }

    // MARK: - Constructor

    public init(wrappedValue: Value) {
        relay = BehaviorRelay(value: wrappedValue)
    }

    // MARK: - Public methods

    /// Returns value of the observable object by wrapped key path and storage key path
    public static subscript<EnclosingSelf: ObservableObject>(
        _enclosingInstance instance: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, PublishedRelay<Value>>
    ) -> Value {
        get {
            instance[keyPath: storageKeyPath].relay.value
        }
        set {
            (instance.objectWillChange as? ObservableObjectPublisher)?
                .send()
            instance[keyPath: storageKeyPath].relay.accept(newValue)
        }
    }

    public func accept<EnclosingSelf: ObservableObject>(
        _ newValue: Value,
        by enclosingInstance: EnclosingSelf,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, PublishedRelay<Value>>
    ) {
        (enclosingInstance.objectWillChange as? ObservableObjectPublisher)?
            .send()
        enclosingInstance[keyPath: storageKeyPath].relay.accept(newValue)
    }

    // MARK: - Private properties

    private let relay: BehaviorRelay<Value>
}
