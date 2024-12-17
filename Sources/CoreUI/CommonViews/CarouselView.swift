//
//  Created by Daniel Pustotin on 22.12.2022.
//

import CoreTypes
import CoreUtils
import SwiftUI

final public class CarouselViewModel: GenericViewModel<CarouselView> {
    // MARK: - Properties

    let count: Int
    let cardSize: CGSize
    let width: CGFloat
    let cardSpacing: CGFloat
    let leftCardCornerWidth: CGFloat
    let rotation: Bool
    let shadow: Bool
    let blur: Bool
    let contentViewModelProvider: Mapper<Int, CommonViewModel>

    let contentOffset: CGFloat
    let maxOffset: Double

    // MARK: - Constructor

    public init(
        count: Int,
        cardSize: CGSize,
        width: CGFloat = ScreenSize.width,
        cardSpacing: CGFloat = Spacing.s,
        leftCardCornerWidth: CGFloat = Spacing.s,
        rotation: Bool = true,
        shadow: Bool = true,
        blur: Bool = true,
        contentProvider contentViewModelProvider: @escaping Mapper<Int, CommonViewModel>
    ) {
        self.count = count
        self.cardSize = cardSize
        self.width = width
        self.cardSpacing = cardSpacing
        self.leftCardCornerWidth = leftCardCornerWidth
        self.rotation = rotation
        self.shadow = shadow
        self.blur = blur
        self.contentViewModelProvider = contentViewModelProvider

        contentOffset = (cardSize.width * count + cardSpacing * (count + 1) - width) / 2
        maxOffset = max(0, (cardSize.width + cardSpacing) * count + cardSpacing + leftCardCornerWidth - width)
    }
}

public struct CarouselView: CommonView {
    // MARK: - Constructor

    public init(viewModel: CarouselViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body

    public var body: some View {
        HStack(spacing: viewModel.cardSpacing) {
            ForEach(0..<viewModel.count, id: \.self) { index in
                let cardOffset = offsetDiff(at: index)

                viewModel.contentViewModelProvider(index).anyView
                    .frame(width: viewModel.cardSize.width, height: viewModel.cardSize.height)
                    .when(viewModel.rotation) { view in
                        view.rotation3DEffect(.degrees(cardOffset / 20.0), axis: Const.cardRotation)
                    }
                    .when(viewModel.shadow) { view in
                        view.shadow(color: Palette.shadow, radius: Spacing.m, x: 0, y: 1)
                    }
                    .when(viewModel.blur) { view in
                        view.blur(radius: abs(cardOffset) * Const.blurRadiusMultiplier)
                    }
                    .offset(x: offset)
                    .highPriorityGesture(dragGesture)
            }
        }
        .offset(x: viewModel.contentOffset)
        .frame(width: viewModel.width)
        .padding(.vertical, Spacing.s)
    }

    // MARK: - Subviews

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                dragOffset = -value.translation.width
            }
            .onEnded { value in
                totalOffset -= value.translation.width
                dragOffset = .zero
                withAnimation(.flip) {
                    updateOffset(dragOffset: -value.translation.width)
                }
            }
    }

    // MARK: - Private methods

    private func updateOffset(dragOffset: CGFloat) {
        currentIndex = index(by: dragOffset)
        totalOffset = offset(at: currentIndex)
    }

    private func index(by offset: CGFloat) -> Int {
        let sign = offset.sign == .minus ? -1 : 1

        var fullCards = Int(abs(offset) / (viewModel.cardSize.width + viewModel.cardSpacing))
        let leftOffset = abs(offset) - (viewModel.cardSize.width + viewModel.cardSpacing) * fullCards
        fullCards += leftOffset > Const.cardPartToChangeIndex * viewModel.cardSize.width ? 1 : 0

        let newIndex = (currentIndex + sign * fullCards).bounded(0, viewModel.count - 1)

        return newIndex
    }

    private func offset(at index: Int) -> CGFloat {
        ((viewModel.cardSize.width + viewModel.cardSpacing) * index).bounded(0, viewModel.maxOffset)
    }

    private func offsetDiff(at index: Int) -> Double {
        offset + offset(at: index) - additionalSideOffset
    }

    // MARK: - Private properties

    @State private var dragOffset: CGFloat = .zero
    @State private var totalOffset: CGFloat = .zero
    @State private var currentIndex: Int = .zero

    @ObservedObject private var viewModel: CarouselViewModel

    private var offset: CGFloat {
        -(dragOffset + totalOffset) + additionalSideOffset
    }

    var additionalSideOffset: CGFloat {
        currentIndex == .zero ? .zero : viewModel.leftCardCornerWidth
    }

    // MARK: - Private nesting

    private enum Const {
        static var cardRotation: (x: CGFloat, y: CGFloat, z: CGFloat) { (x: 0.2, y: -0.5, z: 0.001) }
        static var blurRadiusMultiplier: CGFloat { 0.01 }
        static var cardPartToChangeIndex: CGFloat { 0.2 }
    }
}
