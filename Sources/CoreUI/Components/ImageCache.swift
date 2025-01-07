//
//  Created by Daniel Pustotin on 17.12.2024
//

import UIKit

// swiftlint:disable legacy_objc_type

/// ImageCache provides quick access to loaded images
final public actor ImageCache: Sendable {
    // MARK: - Public properties

    /// Shared instance
    public static var shared = ImageCache()

    // MARK: - Public methods

    /// Loads image from cache
    /// - Parameter key: Key for cached image
    /// - Returns: Image from cache for given key, `nil` if none exists
    public func get(for key: String) -> UIImage? {
        cache.object(forKey: NSString(string: key))
    }

    /// Saves image to cache
    /// - Parameters:
    ///   - key: Key in cache to save image
    ///   - image: Image to save in cache
    public func set(for key: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: key))
    }

    // MARK: - Private properties

    private var cache = NSCache<NSString, UIImage>()
}
// swiftlint:enable legacy_objc_type
