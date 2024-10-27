//
//  Created by Daniel Pustotin on 02.09.2023.
//

public extension String {
    init?(content: (any BinaryInteger)?) {
        guard let content else {
            return nil
        }
        self = String(content)
    }
}
