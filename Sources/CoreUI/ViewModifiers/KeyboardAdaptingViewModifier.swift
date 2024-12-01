//
//  Created by Daniel Pustotin on 01.11.2022.
//

import Combine
import SwiftUI

private struct KeyboardAdaptingViewModifier: ViewModifier {
    // MARK: - Body

    func body(content: Content) -> some View {
        VStack {
            content
                .padding(.bottom, keyboardHeight)
        }
        .onAppear {
            subscribeToKeyboardEvents()
        }
    }

    // MARK: - Private methods

    private func subscribeToKeyboardEvents() {
        NotificationCenter.Publisher(
            center: NotificationCenter.default,
            name: UIResponder.keyboardDidShowNotification
        )
        .sink { notification in
            let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect

            withAnimation(.fastOpen) {
                keyboardHeight = keyboardFrame?.height ?? .zero
                isKeyboardShown = true
            }
        }
        .store(in: &cancellables)

        NotificationCenter.Publisher(
            center: NotificationCenter.default,
            name: UIResponder.keyboardWillHideNotification
        )
        .sink { _ in
            withAnimation(.fastClose) {
                keyboardHeight = .zero
                isKeyboardShown = false
            }
        }
        .store(in: &cancellables)
    }

    private func bottomPadding(for frame: CGRect) -> CGFloat {
        let frameBottom = frame.maxY
        let keyboardTop: CGFloat = ScreenSize.height - keyboardHeight
        return max(frameBottom - keyboardTop, .zero)
    }

    // MARK: - Private properties

    @State private var willHideKeyboard = true
    @State private var isKeyboardShown = false
    @State private var cancellables = Set<AnyCancellable>()

    @State private var currentHeight: CGFloat = .zero
    @State private var keyboardHeight: CGFloat = .zero
}

public extension View {
    /// Adapts the view to the keyboard
    var keyboardAdapting: some View { // swiftlint:disable:this private_subviews swiftui_views_naming
        modifier(KeyboardAdaptingViewModifier())
    }
}
