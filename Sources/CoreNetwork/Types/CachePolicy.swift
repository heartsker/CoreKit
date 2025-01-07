//
//  Created by Daniel Pustotin on 02.01.2025.
//

typealias CachePolicy = URLRequest.CachePolicy

extension CachePolicy: Loggable {
    public var logDescription: String {
        String(describing: self)
    }
}
