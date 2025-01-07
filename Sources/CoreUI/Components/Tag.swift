//
//  Created by Daniel Pustotin on 22.12.2024
//

import SwiftUI

public struct Tag: View {
    public enum TagColor {
        case yellow
        case red
        case green
        case pink
        case blue
        case purple
    }

    public enum State {
        case normal
        case inverted
    }

    private let title: String
    private let color: TagColor
    private let state: State
    private let isEnabled: Bool

    public var body: some View {
        Text(title)
            .foregroundStyle(textColor)
            .padding(.horizontal, Spacing.xxs)
            .padding(.vertical, Spacing.xxxs)
            .background(backgroundColor)
            .roundCorners(Spacing.xxxs)
    }

    private var textColor: Color {
        guard isEnabled else {
            return switch state {
            case .normal: Palette.staticGray5
            case .inverted: Palette.staticGray2
            }
        }

        return switch state {
        case .normal:
            switch color {
            case .yellow, .pink: Palette.staticTextBlack
            case .red, .green, .blue, .purple: Palette.staticTextWhite
            }
        case .inverted:
            accentColor
        }
    }

    private var backgroundColor: Color {
        guard isEnabled else {
            return switch state {
            case .normal: Palette.staticGray2
            case .inverted: Palette.staticGray5
            }
        }

        return switch state {
        case .normal: accentColor
        case .inverted: Palette.staticGray8
        }
    }

    private var accentColor: Color {
        switch color {
        case .yellow: Palette.staticYellow
        case .red: Palette.staticRed
        case .green: Palette.staticGreen
        case .pink: Palette.staticPink
        case .blue: Palette.staticBlue
        case .purple: Palette.staticPurple
        }
    }

    public init(
        title: String,
        color: TagColor,
        state: State = .normal,
        isEnabled: Bool = true
    ) {
        self.title = title
        self.color = color
        self.state = state
        self.isEnabled = isEnabled
    }
}
