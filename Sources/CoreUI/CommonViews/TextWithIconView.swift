//
//  Created by Daniel Pustotin on 30.01.2023.
//

import SwiftUI

public struct TextWithIconView: View {
    // MARK: - Constructor

    public init(_ text: String, _ icon: Imaginator.System, iconColor: Color = Palette.graphicsPrimary) {
        self.text = text
        self.icon = icon
        self.iconColor = iconColor
        self.iconFirst = false
    }

    public init(_ icon: Imaginator.System, _ text: String, iconColor: Color = Palette.graphicsPrimary) {
        self.text = text
        self.icon = icon
        self.iconColor = iconColor
        self.iconFirst = true
    }

    // MARK: - Body

    public var body: some View {
        if iconFirst {
            iconFirstView
        } else {
            textFirstView
        }
    }

    // MARK: - Subviews

    private var iconFirstView: some View {
        HStack(spacing: Spacing.xxxs) {
            icon.image
                .foregroundColor(iconColor)

            Text(text)
        }
    }

    private var textFirstView: some View {
        HStack(spacing: Spacing.xxxs) {
            Text(text)

            icon.image
                .foregroundColor(iconColor)
        }
    }

    // MARK: - Private properties

    private let text: String
    private let icon: Imaginator.System
    private let iconColor: Color?
    private let iconFirst: Bool
}
