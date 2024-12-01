//
//  Created by Daniel Pustotin on 23.07.2022.
//

import SwiftUI

public extension Image {
    // MARK: - Constructor

    /// Creates an image from data
    /// - Parameter data: Data to create image from
    init(data: Data?, default defaultImage: Image = Image()) {
        if let data, let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            self = defaultImage
        }
    }

    /// Creates an empty image
    init() {
        self.init(uiImage: UIImage())
    }
}
