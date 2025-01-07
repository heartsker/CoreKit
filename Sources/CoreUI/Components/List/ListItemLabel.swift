//
//  Created by Daniel Pustotin on 24.12.2024
//

import SwiftUI

public enum ListItemLabel {
    case title(LocalizedStringResource)
    case icon(Imaginator.Symbol)
    case titleAndIcon(LocalizedStringResource, Imaginator.Symbol)
}

public struct ListItemLabelView: View {
    private let label: ListItemLabel

    public init(label: ListItemLabel) {
        self.label = label
    }

    public var body: some View {
        switch label {
        case .title(let title):
            Label(title.key, systemImage: "")
                .labelStyle(.titleOnly)
        case .icon(let symbol):
            Label("", systemImage: symbol.systemName)
                .labelStyle(.iconOnly)
        case .titleAndIcon(let title, let symbol):
            Label(title.key, systemImage: symbol.systemName)
                .labelStyle(.titleAndIcon)
        }
    }
}
