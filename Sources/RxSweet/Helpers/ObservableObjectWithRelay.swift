//
//  Created by Daniel Pustotin on 27.12.2023.
//

import Combine

open class ObservableObjectWithRelay: ObservableObject {
    // MARK: - Public nesting

    public typealias Update = Observable<Void>

    // MARK: - Public properties

    public let disposeBag = DisposeBag()

    // MARK: - Constructor

    public init(updates: [Update] = []) {
        Observable
            .combineLatest(updates)
            .sink {
                self.updateView()
            }
            .disposed(by: disposeBag)
    }

    // MARK: - Private methods

    public func updateView() {
        Task { @MainActor in
            objectWillChange.send()
        }
    }

    // MARK: - Private properties

    private var updates: [Update] = []
}
