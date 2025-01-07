//
//  Created by Daniel Pustotin on 11.08.2023.
//

public extension BehaviorRelay where Element == Double {
    var isOne: Bool {
        value.isEqual(to: 1.0)
    }

    static func < (lhs: RxRelay.BehaviorRelay<Element>, rhs: RxRelay.BehaviorRelay<Element>) -> Bool {
        lhs.value < rhs.value
    }

    static func < (lhs: BehaviorRelay<Element>, rhs: Element) -> Bool {
        lhs.value < rhs
    }

    static func > (lhs: RxRelay.BehaviorRelay<Element>, rhs: RxRelay.BehaviorRelay<Element>) -> Bool {
        lhs.value > rhs.value
    }

    static func > (lhs: BehaviorRelay<Element>, rhs: Element) -> Bool {
        lhs.value > rhs
    }

    static func == (lhs: RxRelay.BehaviorRelay<Element>, rhs: RxRelay.BehaviorRelay<Element>) -> Bool {
        lhs.value == rhs.value
    }

    static func == (lhs: RxRelay.BehaviorRelay<Element>, rhs: Element) -> Bool {
        lhs.value == rhs
    }

    func isLess(than other: Element) -> Bool {
        value.isLess(than: other)
    }
}
