//
//  Created by Daniel Pustotin on 18.12.2024
//

import SwiftUI

public struct ProgressBar: View {
    // MARK: - Private properties

    private var progress: Double
    private var barForegroundStyle = AnyShapeStyle(Palette.accent)

    // MARK: - Constructor

    public init(progress: Double) {
        self.progress = progress
    }

    private init(progress: Double, barForegroundStyle: AnyShapeStyle) {
        self.progress = progress
        self.barForegroundStyle = barForegroundStyle
    }

    // MARK: - Body

    public var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: Const.height)
                    .foregroundColor(Palette.backgroundSecondary)
                    .roundCorners(Const.cornerRadius)

                Rectangle()
                    .frame(
                        width: min(progress * proxy.size.width, proxy.size.width),
                        height: Const.height
                    )
                    .foregroundStyle(barForegroundStyle)
                    .roundCorners(Const.cornerRadius)
            }
            .dropShadow()
        }
        .frame(height: Const.height)
        .frame(maxWidth: .infinity)
    }

    // MARK: - Private nesting

    private enum Const {
        static let height = Spacing.xxs
        static let cornerRadius = height / 2
    }
}

public extension ProgressBar {
    func barStyle<S: ShapeStyle>(_ style: S) -> ProgressBar {
        ProgressBar(progress: self.progress, barForegroundStyle: AnyShapeStyle(style))
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 0.6)
            .previewLayout(.sizeThatFits)
    }
}
