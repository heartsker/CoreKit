//
//  Created by Daniel Pustotin on 05.05.2024.
//

import Foundation

public extension Collection {
    func anySatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        try !allSatisfy { element in
            try !predicate(element)
        }
    }
}
