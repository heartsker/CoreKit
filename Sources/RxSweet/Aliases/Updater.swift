//
//  Created by Daniel Pustotin on 11.02.2024.
//

public typealias Updater = BehaviorRelay<Void>
public typealias Updates = Observable<Void>

public extension Updater {
    // MARK: - Public properties

    var updates: Updates {
        asObservable()
    }

    // MARK: - Constructor

    convenience init() {
        self.init(value: ())
    }

    // MARK: - Public methods

    func update() {
        accept(())
    }
}
