//
//  Created by Daniel Pustotin on 24.12.2024
//

import SwiftUI

public struct MenuListItem<T: Localizable & Hashable>: View {
    private let label: ListItemLabel
    private let options: [T]

    @Binding private var selected: T?

    public var body: some View {
        HStack {
            ListItemLabelView(label: label)

            Spacer()

            Menu {
                ForEach(options, id: \.self) { option in
                    Button {
                        withAnimation {
                            selected = option
                        }
                    } label: {
                        Text(option.localizedName)
                    }
                }
            } label: {
                HStack {
                    if let selected {
                        Text(selected.localizedName)
                    } else {
                        Text("Choose", comment: "Menu list item choose placeholder")
                    }

                    Imaginator.Symbol.rightChevron.image
                        .foregroundStyle(Palette.textTertiary)
                        .fontStyle(.Text.s)
                }
                .foregroundStyle(Palette.textSecondary)
                .fontStyle(.Text.m)
            }
        }
    }

    public init(label: ListItemLabel, options: [T], selected: Binding<T?>) {
        self.label = label
        self.options = options
        _selected = selected
    }
}
