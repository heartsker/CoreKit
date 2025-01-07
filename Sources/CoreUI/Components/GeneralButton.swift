//
//  Created by Daniel Pustotin on 23.12.2024
//

import SwiftUI

public struct GeneralButton: View {
    public enum Size {
        case s
        case m
        case l
    }

    public enum Shape {
        case rounded
        case capsule
        case none
    }

    public enum Style {
        case solid
        case glass
        case none
    }

    private let text: String
    private let leftIconSymbol: Imaginator.Symbol?
    private let rightIconSymbol: Imaginator.Symbol?
    private let size: Size
    private let shape: Shape
    private let style: Style
    private let isDisabled: Bool
    private let action: Action?

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

            Text(text)
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
        text: String,
        leftIconSymbol: Imaginator.Symbol? = nil,
        rightIconSymbol: Imaginator.Symbol? = nil,
        size: Size = .m,
        shape: Shape = .rounded,
        style: Style = .solid,
        isDisabled: Bool = false,
        action: Action?
    ) {
        self.text = text
        self.leftIconSymbol = leftIconSymbol
        self.rightIconSymbol = rightIconSymbol
        self.size = size
        self.shape = shape
        self.style = style
        self.isDisabled = isDisabled
        self.action = action
    }
}
