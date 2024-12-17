//
//  Created by Daniel Pustotin on 11.07.2024
//

final public class SmallLoaderViewModel: GenericViewModel<SmallLoaderView> {
    // MARK: - Public nesting

    public enum Size {
        case s
        case m
        case l
        case xl
    }

    // MARK: - Public properties

    var loaderSize: CGFloat {
        switch size {
        case .s: Spacing.s
        case .m: Spacing.m
        case .l: Spacing.l
        case .xl: Spacing.xl
        }
    }

    var lineWidth: CGFloat {
        switch size {
        case .s: LineWidth.s
        case .m: LineWidth.m
        case .l: LineWidth.m
        case .xl: LineWidth.l
        }
    }

    // MARK: - Constructor

    init(size: Size) {
        self.size = size
    }

    // MARK: - Private properties

    private let size: Size
}

public struct SmallLoaderView: CommonView {
    // MARK: - Constructor

    public init(viewModel: SmallLoaderViewModel) {
        self.viewModel = viewModel
    }

    public init(size: SmallLoaderViewModel.Size) {
        self.viewModel = SmallLoaderViewModel(size: size)
    }

    // MARK: - Body

    public var body: some View {
        Circle()
            .trim(from: 0, to: 0.6)
            .stroke(lineWidth: viewModel.lineWidth)
            .foregroundStyle(Palette.graphicsPrimary)
            .rotationEffect(.degrees(loading ? 360 : 0))
            .squareFrame(viewModel.loaderSize)
            .onAppear {
                withAnimation(
                    .linear(duration: Const.animationDuration)
                        .repeatForever(autoreverses: false)
                ) {
                    loading = true
                }
            }
    }

    // MARK: - Private properties

    @State private var loading = false

    private let viewModel: SmallLoaderViewModel

    // MARK: - Private nesting

    private enum Const {
        static let animationDuration: Double = 1.0
    }
}
