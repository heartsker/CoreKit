//
//  Created by Daniel Pustotin on 15.07.2024
//

private struct AlignHorizontallyInContainerViewModifier: ViewModifier {
    // MARK: - Constructor

    init(alignment: VerticalAlignment) {
        self.alignment = alignment
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        HStack(alignment: alignment) {
            content
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Private properties

    private let alignment: VerticalAlignment
}

public extension View {
    /// Centers the view horizontally in its container
    /// - Returns: Modified view
    func centerHorizontally() -> some View {
        self.modifier(AlignHorizontallyInContainerViewModifier(alignment: .center))
    }

    /// Aligns the view horizontally in its container
    /// - Parameter alignment: Alignment to use
    /// - Returns: Modified view
    func alignHorizontally(_ alignment: VerticalAlignment) -> some View {
        self.modifier(AlignHorizontallyInContainerViewModifier(alignment: alignment))
    }
}
