//
//  Created by Daniel Pustotin on 03.07.2022.
//

import CommonTypes
import CommonUtils
import SwiftUI

/// Assets manager
public enum Imaginator {
    // MARK: - Public methods

    /// Returns image in current module bundle
    /// - Parameters:
    ///   - name: Name of the image
    /// - Returns: Resulting image
    public static func image(_ name: String) -> Image {
        image(name, in: .module)
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
    public static func image(_ imageData: ImageData?, placeholderImage: Image? = nil) -> Image {
        let placeholderImage = placeholderImage ?? Image()

        guard let imageData else {
            return placeholderImage
        }

        guard !imageData.id.isEmpty else {
            return Image(data: imageData.data, default: placeholderImage)
        }

        if lock.locked(images[imageData.id]) == nil {
            let image = Image(data: imageData.data, default: placeholderImage)
            lock.locked {
                images[imageData.id] = image
            }
            return image
        }

        let savedImage = lock.locked(images[imageData.id])

        return savedImage ?? placeholderImage
    }

    // MARK: - Private properties

    private static var images: [UID: Image] = [:]
    private static let lock = UnfairLock()
}
