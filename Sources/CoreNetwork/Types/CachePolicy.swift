//
//  Created by Daniel Pustotin on 02.01.2025.
//

import Foundation

public typealias CachePolicy = URLRequest.CachePolicy

extension CachePolicy: Loggable {
    public var logDescription: String {
        String(describing: self)
    }
}
