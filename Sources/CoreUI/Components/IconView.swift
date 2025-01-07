//
//  Created by Daniel Pustotin on 22.06.2024
//

import CoreTypes
import SwiftUI

public struct Icon {
    public enum Size {
        case s
        case m
        case l
    }

    public let symbol: Imaginator.Symbol
    public let size: Size

    public init(symbol: Imaginator.Symbol, size: Size) {
        self.symbol = symbol
        self.size = size
    }
}

public struct IconView: View {
    // MARK: - Properties

    private let icon: Icon

    public var body: some View {
        icon.symbol.image
            .resizable()
            .scaledToFit()
            .squareFrame(frameSize)
    }

    private var frameSize: CGFloat {
        switch icon.size {
        case .s: Spacing.xs
        case .m: Spacing.m
        case .l: Spacing.xl
        }
    }

    // MARK: - Constructor

    public init(_ icon: Icon) {
        self.icon = icon
    }
}
