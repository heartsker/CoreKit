//
//  Created by Daniel Pustotin on 17.01.2024.
//

import Combine

open class RxObservableObject: ObservableObject {
    // MARK: - Public properties

    public let objectChanges: Observable<Void>

    // MARK: - Constructor

    public init() {
        objectChanges = objectChangesImpl.asObservable()

        setupChangesSubscription()
    }

    // MARK: - Public methods

    final public func onObjectChanged() {
        objectChangesImpl.accept(())
    }

    // MARK: - Private methods

    private func setupChangesSubscription() {
        objectChanges
            .sink {
                Task {
                    await MainActor.run {
                        self.objectWillChange.send()
                    }
                }
            }
            .disposed(by: disposeBag)
    }

    // MARK: - Private properties

    private let objectChangesImpl = BehaviorRelay<Void>(value: ())
    private let disposeBag = DisposeBag()
}
