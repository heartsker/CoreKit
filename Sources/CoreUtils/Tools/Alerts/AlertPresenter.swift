//
//  Created by Daniel Pustotin on 24.09.2023.
//

import Combine
import SwiftUI

final public class AlertPresenter: ObservableObject {
    // MARK: - Public properties

    @Published public private(set) var alert: Alert?

    public var isPresentedAlert: Binding<Bool> {
        Binding {
            self.alert?.type == .alert
        } set: { newValue in
            if !newValue {
                self.alert = nil
            }
        }
    }

    public var isPresentedConfirmationDialog: Binding<Bool> {
        Binding {
            self.alert?.type == .confirmationDialog
        } set: { newValue in
            if !newValue {
                self.alert = nil
            }
        }
    }

    // MARK: - Constructor

    public init() {}

    // MARK: - Public methods

    public func present(alert: Alert) {
        self.alert = alert
    }
}
