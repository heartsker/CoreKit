//
//  Created by Daniel Pustotin on 27.12.2023.
//

import SwiftUI

public protocol CommonView: View {
    // MARK: - Public nesting

    associatedtype ViewModelType: GenericViewModel<Self>

    // MARK: - Constructor

    init(viewModel: ViewModelType)
}
