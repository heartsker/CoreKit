//
//  Created by Daniel Pustotin on 17.10.2023.
//
//  "i dont know how to do this shit but my bf does it very well because he is the best developer that i ever knew" © Ann
//

import CommonTypes
import Logger
import RxSweet
import SwiftUI

open class CommonViewModel: RxObservableObject, Identifiable {
    // MARK: - Public nesting

    public typealias Update = Observable<Void>

    // MARK: - Public properties

    open var anyView: AnyView {
        logger.critical(
            ".anyView called on CommonViewModel",
            error: CommonErrors.prohibitedBaseClassMethodCall(Self.self)
        )
        preconditionFailure()
    }

    final public let id = UID.unique

    final private var updates: [Update] = []
    public let disposeBag = DisposeBag()

    // MARK: - Constructor

    public init(updates: [Update] = []) {
        super.init()

        Observable
            .combineLatest(updates)
            .sink {
                self.onObjectChanged()
            }
            .disposed(by: disposeBag)
    }

    // MARK: - Public methods

    public func bind<O: ObservableConvertibleType>(_ source: O, to destination: BehaviorRelay<O.Element>) {
        source.asObservable()
            .bind(to: destination)
            .disposed(by: disposeBag)
    }

    public func bind<O: ObservableConvertibleType>(_ source: O, perform action: @escaping Applicator<O.Element>) {
        source.asObservable()
            .sink(onNext: action)
            .disposed(by: disposeBag)
    }

    public func bindAnimated<O: ObservableConvertibleType>(
        _ source: O,
        _ animation: Animation?,
        perform action: @escaping Applicator<O.Element>
    ) {
        source.asObservable()
            .sinkAnimated(animation, perform: action)
            .disposed(by: disposeBag)
    }
}
