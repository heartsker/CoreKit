//
//  Created by Daniel Pustotin on 17.01.2025
//

import SwiftUI

public struct InfoView: View {
    // MARK: - Properties

    private let title: String
    private let description: String?
    private let secondaryDescription: String?
    private let icon: Imaginator.Symbol?
    private let button: Button?

    public var body: some View {
        VStack(spacing: Spacing.s) {
            Spacer()

            if let icon {
                IconView(Icon(symbol: icon, size: .l))
                    .foregroundStyle(Palette.graphicsSecondary)
            }

            Text(title)
                .fontStyle(.Title.l)
                .foregroundStyle(Palette.textPrimary)

            if let description {
                Text(description)
                    .fontStyle(.Text.s)
                    .foregroundStyle(Palette.textTertiary)
            }

            if let secondaryDescription {
                Text(secondaryDescription)
                    .fontStyle(.Text.xs)
                    .foregroundStyle(Palette.textQuaternary)
            }

            if let button {
                GeneralButton(button.title, action: button.action)
                    .buttonStyle(.none)
                    .buttonShape(.none)
            }

            Spacer()
        }
        .multilineTextAlignment(.center)
    }

    // MARK: - Constructor

    public init(
        title: String,
        description: String? = nil,
        secondaryDescription: String? = nil,
        icon: Imaginator.Symbol? = nil,
        button: Button? = nil
    ) {
        self.title = title
        self.description = description
        self.secondaryDescription = secondaryDescription
        self.icon = icon
        self.button = button
    }
}

// MARK: - Nesting

public extension InfoView {
    struct Button {
        let title: String
        let action: Action

        public init(title: String, action: @escaping Action) {
            self.title = title
            self.action = action
        }
    }
}
