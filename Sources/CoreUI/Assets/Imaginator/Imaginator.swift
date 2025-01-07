//
//  Created by Daniel Pustotin on 03.07.2022.
//

import CoreTypes
import CoreUtils
import SwiftUI

/// Assets manager
public enum Imaginator: @unchecked Sendable {
    // MARK: - Public methods

    /// Returns image in the main bundle
    /// - Parameters:
    ///   - name: Name of the image
    /// - Returns: Resulting image
    public static func image(_ name: String) -> Image {
        image(name, in: .main)
    }

    /// Returns image in given bundle
    /// - Parameters:
    ///   - name: Name of the image
    ///   - bundle: Bundle to search image in
    /// - Returns: Resulting image
    public static func image(_ name: String, in bundle: Bundle) -> Image {
        Image(name, bundle: bundle)
    }

    /// Returns image saved in cache
    /// - Parameters:
    ///   - imageData: Image data
    /// - Returns: Image from cache or newly created and saved image
    public static func image(_ imageData: ImageData?, placeholderImage: Image? = nil) async -> Image {
        let placeholderImage = placeholderImage ?? Image()

        guard let imageData else {
            return placeholderImage
        }

        guard !imageData.id.isEmpty else {
            return Image(data: imageData.data, default: placeholderImage)
        }

        if let cachedImage = await cache.getImage(for: imageData.id) {
            return cachedImage
        }

        let image = Image(data: imageData.data, default: placeholderImage)
        await cache.saveImage(image, for: imageData.id)

        return image
    }

    // MARK: - Private properties

    private static let cache = ImageCacheActor()
}
