//
//  Created by Daniel Pustotin on 24.09.2023.
//

public enum AlertFactory {
    public static func make(
        with title: String,
        message: String? = nil,
        type: AlertType = .confirmationDialog,
        actions: [AlertAction] = []
    ) -> Alert {
        Alert(
            title: title,
            message: message,
            type: type,
            actions: actions
        )
    }

    @MainActor public static func makeWithCancelButton(
        title: String,
        message: String? = nil,
        type: AlertType = .confirmationDialog,
        actions: [AlertAction] = []
    ) -> Alert {
        Alert(
            title: title,
            message: message,
            type: type,
            actions: actions + [.cancel]
        )
    }
}
