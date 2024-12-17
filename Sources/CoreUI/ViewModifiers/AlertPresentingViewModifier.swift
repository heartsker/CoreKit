//
//  Created by Daniel Pustotin on 24.09.2023.
//

import CoreUtils
import SwiftUI

private struct AlertPresentingViewModifier: ViewModifier {
    // MARK: - Constructor

    init(alertPresenter: AlertPresenter) {
        self.alertPresenter = alertPresenter
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        let alert = alertPresenter.alert

        content
            .confirmationDialog(
                Text(content: alert?.title),
                isPresented: alertPresenter.isPresentedConfirmationDialog,
                titleVisibility: .visible,
                actions: {
                    alertAction(for: alert)
                },
                message: {
                    Text(content: alert?.message)
                }
            )
            .alert(
                alert?.title ?? String(),
                isPresented: alertPresenter.isPresentedAlert,
                presenting: alert,
                actions: { alert in
                    alertAction(for: alert)
                },
                message: { alert in
                    Text(content: alert.message)
                }
            )
    }

    // MARK: - Subviews

    private func alertAction(for alert: CoreUtils.Alert?) -> some View {
        ForEach(alert?.actions ?? [], id: \.title) { action in
            Button(role: action.role, action: action.perform) {
                Text(action.title)
            }
        }
    }

    // MARK: - Private properties

    @ObservedObject private var alertPresenter: AlertPresenter
}

public extension View {
    func alertPresenting(with alertPresenter: AlertPresenter) -> some View {
        modifier(AlertPresentingViewModifier(alertPresenter: alertPresenter))
    }
}
