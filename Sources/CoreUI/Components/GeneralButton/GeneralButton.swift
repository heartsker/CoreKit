//
//  Created by Daniel Pustotin on 23.12.2024
//

import SwiftUI

public struct GeneralButton: View {
    public enum Size: Sendable {
        case s
        case m
        case l
    }

    public enum Shape: Sendable {
        case rounded
        case capsule
        case none
    }

    public enum Style: Sendable {
        case solid
        case glass
        case none
    }

    private let title: String
    private let action: Action?
    @Environment(\.generalButtonSize) private var size: Size
    @Environment(\.generalButtonShape) private var shape: Shape
    @Environment(\.generalButtonStyle) private var style: Style
    @Environment(\.generalButtonDisabled) private var isDisabled: Bool
    @Environment(\.generalButtonLeftIcon) private var leftIconSymbol: Imaginator.Symbol?
    @Environment(\.generalButtonRightIcon) private var rightIconSymbol: Imaginator.Symbol?

    public var body: some View {
        Button {
            action?()
        } label: {
            contentViewWithBackground
                .roundCorners(cornerRadius)
        }
        .disabled(isDisabled)
    }

    private var contentViewWithBackground: some View {
        switch style {
        case .solid:
            contentView
                .background(Palette.backgroundSecondary)
                .anyView
        case .glass:
            contentView
                .background(.ultraThinMaterial)
                .anyView
        case .none:
            contentView
                .anyView
        }
    }

    private var contentView: some View {
        HStack(spacing: spacing) {
            if let leftIconSymbol {
                IconView(Icon(symbol: leftIconSymbol, size: iconSize))
            }

            Text(title)
                .fontStyle(fontStyle)
                .underline(shape == .none)

            if let rightIconSymbol {
                IconView(Icon(symbol: rightIconSymbol, size: iconSize))
            }
        }
        .padding(horizontal: horizontalPadding, vertical: verticalPadding)
    }

    private var fontStyle: FontStyle {
        switch size {
        case .s: .Text.xs
        case .m: .Text.m
        case .l: .Text.l
        }
    }

    private var iconSize: Icon.Size {
        switch size {
        case .s: .s
        case .m: .m
        case .l: .l
        }
    }

    private var spacing: CGFloat {
        switch size {
        case .s: Spacing.xxs
        case .m: Spacing.xxs
        case .l: Spacing.s
        }
    }

    private var horizontalPadding: CGFloat {
        switch size {
        case .s: Spacing.s
        case .m: Spacing.m
        case .l: Spacing.l
        }
    }

    private var verticalPadding: CGFloat {
        switch size {
        case .s: Spacing.xxs
        case .m: Spacing.s
        case .l: Spacing.m
        }
    }

    private var cornerRadius: CGFloat {
        switch shape {
        case .rounded: Radii.xxs
        case .capsule: Radii.infinity
        case .none: .zero
        }
    }

    // MARK: - Constructor

    public init(
        _ title: String,
        action: Action?
    ) {
        self.title = title
        self.action = action
    }
}
