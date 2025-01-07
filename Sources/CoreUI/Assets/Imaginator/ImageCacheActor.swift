//
//  Created by Daniel Pustotin on 17.12.2024
//

import SwiftUI

actor ImageCacheActor {
    private var images: [UID: Image] = [:]

    func getImage(for id: UID) -> Image? {
        images[id]
    }

    func saveImage(_ image: Image, for id: UID) {
        images[id] = image
    }
}
