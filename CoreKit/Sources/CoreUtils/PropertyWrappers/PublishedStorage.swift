//
//  Created by Daniel Pustotin on 12.06.2023.
//

import Combine

/// Property wrapper, similar to `@AppStorage`, with publishing changes
/// Based on https://github.com/OpenCombine/OpenCombine/blob/master/Sources/OpenCombine/Published.swift
@propertyWrapper
public struct PublishedStorage<Value> where Value: Codable {
    // MARK: - Public nesting

    /// A publisher for properties marked with the `@Published` attribute.
    public struct Publisher: Combine.Publisher {
        // MARK: - Public nesting

        public typealias Output = Value

        public typealias Failure = Never

        public var publisher: AnyPublisher<Value, Never> {
            subject.eraseToAnyPublisher()
        }

        // MARK: - Constructor

        // swiftlint:disable:next strict_fileprivate
        fileprivate init(_ output: Output) {
            subject = CurrentValueSubject(output)
        }

        // MARK: - Public methods

        public func receive<Downstream: Subscriber>(subscriber: Downstream)
        where Downstream.Input == Value, Downstream.Failure == Never {
            subject.subscribe(subscriber)
        }

        // MARK: - Private properties

        // swiftlint:disable:next strict_fileprivate
        fileprivate let subject: Combine.CurrentValueSubject<Value, Never>
    }

    // MARK: - Public properties

    /// Property wrapper's wrapped value
    @available(*, unavailable, message: "@PublishedStorage is only available on properties of classes")
    public var wrappedValue: Value {
        get {
            preconditionFailure()
        }
        // swiftlint:disable:next unused_setter_value
        set {
            preconditionFailure()
        }
    }

    public var projectedValue: Publisher {
        publisher
    }

    // MARK: - Constructor

    public init(wrappedValue: Value, _ key: String) {
        self.key = key

        let storage = Storage(name: "published.storage." + key, keys: StorageKeys.self)
        let storedValue = storage.value(for: .value, default: wrappedValue)

        publisher = Publisher(storedValue)
        self.storage = storage
    }

    // MARK: - Public methods

    /// Returns value of the observable object by wrapped key path and storage key path
    public static subscript<EnclosingSelf: ObservableObject>(
        _enclosingInstance instance: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, PublishedStorage<Value>>
    ) -> Value {
        get {
            instance[keyPath: storageKeyPath].publisher.subject.value
        }
        set {
            (instance.objectWillChange as? ObservableObjectPublisher)?.send()
            instance[keyPath: storageKeyPath].publisher.subject.send(newValue)
            instance[keyPath: storageKeyPath].storage.set(value: newValue, for: .value)
        }
    }

    // MARK: - Private properties

    private let publisher: Publisher
    private let key: UID

    private var objectWillChange: ObservableObjectPublisher?
    private let storage: Storage<StorageKeys>

    // MARK: - Private nesting

    private enum StorageKeys: CodingKey {
        case value
    }
}
