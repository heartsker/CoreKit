//
//  Created by Daniel Pustotin on 27.12.2023.
//

import CoreTypes
import CoreUtils
import CoreLogger
import SwiftUI

@MainActor
open class GenericViewModel<ViewType: CommonView>: CommonViewModel {
    // MARK: - Public properties

    final public var view: ViewType {
        guard let viewModel = self as? ViewType.ViewModelType else {
            logger.critical(
                ".view called on GenericViewModel",
                error: CommonErrors.prohibitedBaseClassMethodCall(Self.self)
            )
            preconditionFailure()
        }
        return ViewType(viewModel: viewModel)
    }

    @available(*, unavailable, message: "Use `view` property instead")
    final public override var anyView: AnyView {
        view
            .anyView
    }
}
