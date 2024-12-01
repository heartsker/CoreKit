//
//  Created by Daniel Pustotin on 09.07.2022.
//

import SwiftUI

public struct ScrollDetectionView: View {
    // MARK: - Constructor

    public init(scrollOffset: Binding<CGFloat>, direction: Axis.Set = .vertical) {
        self.direction = direction
        _scrollOffset = scrollOffset
    }

    // MARK: - Body

    public var body: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset(proxy))
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            scrollOffset = value
        }
        .frame(height: .zero)
    }

    // MARK: - Private methods

    private func offset(_ proxy: GeometryProxy) -> CGFloat {
        switch direction {
        case .horizontal:
            return proxy.frame(in: .named("scroll")).minX

        default:
            return proxy.frame(in: .named("scroll")).minY
        }
    }

    // MARK: - Private properties

    private let direction: Axis.Set
    @Binding public var scrollOffset: CGFloat
}

private extension ScrollDetectionView {
    struct ScrollPreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = .zero

        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
}
