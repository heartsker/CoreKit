//
//  Created by Daniel Pustotin on 22.06.2024
//

import CommonTypes
import SwiftUI

final public class IconViewModel: GenericViewModel<IconView> {
    // MARK: - Public nesting

    public enum IconSize {
        case s
        case m
        case l
    }

    // MARK: - Public properties

    let icon: Imaginator.System
    let color: Color?

    var frameSize: CGFloat {
        switch size {
        case .s: Spacing.xs
        case .m: Spacing.m
        case .l: Spacing.xl
        }
    }

    // MARK: - Constructor

    public init(
        _ icon: Imaginator.System,
        size: IconSize,
        color: Color? = Palette.graphicsPrimary
    ) {
        self.icon = icon
        self.size = size
        self.color = color
    }

    // MARK: - Private properties

    let size: IconSize
}

public struct IconView: CommonView {
    // MARK: - Constructor

    public init(viewModel: IconViewModel) {
        self.viewModel = viewModel
    }

    public init(
        _ icon: Imaginator.System,
        size: IconViewModel.IconSize,
        color: Color? = Palette.graphicsPrimary
    ) {
        self.viewModel = IconViewModel(
            icon,
            size: size,
            color: color
        )
    }

    // MARK: - Body

    public var body: some View {
        viewModel.icon.image
            .resizable()
            .scaledToFit()
            .squareFrame(viewModel.frameSize)
            .foregroundColor(viewModel.color)
    }

    // MARK: - Private properties

    private let viewModel: IconViewModel
}
