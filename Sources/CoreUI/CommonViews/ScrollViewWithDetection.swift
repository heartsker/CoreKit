//
//  Created by Daniel Pustotin on 04.12.2022.
//

import CoreTypes
import SwiftUI

public struct ScrollViewWithDetection<Content>: View where Content: View {
    // MARK: - Constructor

    public init(
        _ axes: Axis.Set = .vertical,
        showIndicators: Bool = false,
        scrollOffset: Binding<CGFloat> = .constant(.zero),
        scrollProgress: Binding<Double> = .constant(.zero),
        @ViewBuilder content: @escaping Emitter<Content>
    ) {
        self.axes = axes
        self.showIndicators = showIndicators
        self._scrollOffset = scrollOffset
        self._relativeProgress = scrollProgress
        self.content = content()
    }

    public var body: some View {
        ScrollView(axes, showsIndicators: showIndicators) {
            VStack {
                ScrollDetectionView(scrollOffset: $scrollOffset, direction: axes)

                content
            }
            .overlay(
                GeometryReader { contentProxy in
                    Color.clear
                        .onChange(of: scrollOffset) { _ in
                            let contentSize = contentProxy.size
                            let scrollDistance = ScreenSize.height - scrollOffset
                            let ratio = Double(scrollDistance / contentSize.height)

                            relativeProgress = ratio
                        }
                }
            )
        }
    }

    // MARK: - Private properties

    private let axes: Axis.Set
    private let showIndicators: Bool
    @ViewBuilder private let content: Content
    @Binding private var scrollOffset: CGFloat
    @Binding private var relativeProgress: Double
}
