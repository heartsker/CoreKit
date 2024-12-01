//
//  Created by Daniel Pustotin on 31.10.2024
//

import SwiftUI
import Combine

struct DisposeWithViewModifier: ViewModifier {
    @State private var cancellables: [AnyCancellable] = []

    private let createDisposable: () -> AnyCancellable

    init(createDisposable: @escaping () -> AnyCancellable) {
        self.createDisposable = createDisposable
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                let disposable = createDisposable()
                cancellables.append(disposable)
            }
            .onDisappear {
                cancellables.forEach { $0.cancel() }
                cancellables.removeAll()
            }
    }
}

public extension View {
    func disposeWithView(_ createDisposable: @escaping () -> AnyCancellable) -> some View {
        modifier(DisposeWithViewModifier(createDisposable: createDisposable))
    }
}
