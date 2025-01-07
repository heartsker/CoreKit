//
//  Created by Daniel Pustotin on 23.11.2023.
//

public extension ObservableType {
    func void() -> Observable<Void> {
        map { _ in () }
    }
}
