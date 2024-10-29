//
//  Created by Daniel Pustotin on 10.12.2023.
//

public extension BehaviorRelay {
    func update(transform: (Element) -> Element) {
        accept(transform(value))
    }
}
