//
//  Created by Daniel Pustotin on 30.01.2023.
//

import SwiftUI

public extension Imaginator.Symbol {
    var image: Image {
        // swiftlint:disable:next system_image_usage
        Image(systemName: self.rawValue)
    }
}

public extension Imaginator.Symbol.Number {
    /// Image with corresponding number
    var image: Image {
        switch self {
        case let .circle(number, fill):
            // swiftlint:disable:next system_image_usage
            return Image(systemName: number.description + ".circle" + (fill ? ".fill" : ""))

        case let .square(number, fill):
            // swiftlint:disable:next system_image_usage
            return Image(systemName: number.description + ".square" + (fill ? ".fill" : ""))
        }
    }
}
