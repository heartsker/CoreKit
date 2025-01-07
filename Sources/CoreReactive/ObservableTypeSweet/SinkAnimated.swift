//
//  Created by Daniel Pustotin on 10.12.2023.
//

import SwiftUI

public extension ObservableType {
    func sinkAnimated(_ animation: Animation?, perform action: @escaping (Element) -> Void) -> Disposable {
        sink { newValue in
            withAnimation(animation) {
                action(newValue)
            }
        }
    }
}
