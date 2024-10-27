//
//  Created by Daniel Pustotin on 19.11.2023.
//

import Foundation

public enum PropertyListReader {
    // MARK: - Public methods

    /// Returns the value for the specified key in the app's Info.plist file
    /// - Parameters:
    ///   - key: The key to search for
    /// - Returns: The value for the specified key or an empty string if the key is not found
    public static func value(for key: PropertyListKey) -> String {
        Bundle.main.infoDictionary?[key.key] as? String ?? String()
    }

    /// Returns the value for the specified key in the specified dictionary in the app's Info.plist file
    /// - Parameters:
    ///   - key: The key to search for
    ///   - dictionaryKey: The key of the dictionary to search in.
    /// - Returns: The value for the specified key in the specified dictionary
    /// Or an empty string if the key is not found or the dictionary is not found
    public static func value(for key: PropertyListKey, in dictionaryKey: PropertyListKey) -> String {
        let dictionary = Bundle.main.infoDictionary?[dictionaryKey.key] as? [String: Any] ?? [:]
        return dictionary[key.key] as? String ?? String()
    }
}
