//
//  Created by Daniel Pustotin on 22.10.2022.
//

import Combine
import Foundation

final public class Storage<Key: CodingKey>: ObservableObject {
    // MARK: - Public methods

    public func contains(key: Key) -> Bool {
        lock.locked {
            storage.object(forKey: prefix + key.stringValue) != nil
        }
    }

    public func value<T>(for key: Key, type: T.Type) -> T? where T: Codable {
        let data = lock.locked {
            storage.object(forKey: prefix + key.stringValue) as? Data ?? Data()
        }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    public func value<T>(for key: Key, default: T) -> T where T: Codable {
        let data = lock.locked {
            storage.object(forKey: prefix + key.stringValue) as? Data ?? Data()
        }
        return (try? JSONDecoder().decode(T.self, from: data)) ?? `default`
    }

    public func set<T>(value: T, for key: Key) where T: Codable {
        guard let encoded = try? JSONEncoder().encode(value) else {
            return
        }
        lock.locked {
            storage.set(encoded, forKey: prefix + key.stringValue)
        }
    }

    public func remove(for key: Key) {
        lock.locked {
            storage.removeObject(forKey: prefix + key.stringValue)
        }
    }

    // MARK: - Constructor

    public init(name prefix: String, keys: Key.Type) {
        self.prefix = prefix + "."
    }

    // MARK: - Private properties

    private var storage = UserDefaults.standard
    private let prefix: String

    private let lock = UnfairLock()
}

public extension Storage where Key: UniqueKeyStoring {
    convenience init(keys: Key.Type) {
        self.init(name: keys.uid, keys: keys)
    }
}
