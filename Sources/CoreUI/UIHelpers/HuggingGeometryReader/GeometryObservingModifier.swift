//
//  Created by Daniel Pustotin on 13.06.2023.
//

<<<<<<< Updated upstream
=======
import CoreTypes
>>>>>>> Stashed changes
import SwiftUI

private struct GeometryObservingModifier: ViewModifier {
    // MARK: - Constructor

    init(
        space: CoordinateSpace,
        observation: GeometryObservationKind,
        onChange changeHandler: @escaping Applicator<CGRect>
    ) {
        self.space = space
        self.observation = observation
        self.changeHandler = changeHandler
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    let newValue: CGRect = {
                        let frame = proxy.frame(in: space)
                        switch observation {
                        case .all:
                            return frame

                        case .vertical:
                            return CGRect(
                                origin: CGPoint(x: .zero, y: frame.origin.y),
                                size: CGSize(width: .zero, height: frame.height)
                            )

                        case .horizontal:
                            return CGRect(
                                origin: CGPoint(x: frame.origin.x, y: .zero),
                                size: CGSize(width: frame.width, height: .zero)
                            )

                        case .size:
                            return CGRect(
                                origin: .zero,
                                size: CGSize(width: frame.width, height: frame.height)
                            )
                        }
                    }()

                    Color.clear.preference(key: FrameKey.self, value: newValue)
                }
            )
            .onPreferenceChange(FrameKey.self) { frame in
                Task { @MainActor in
                    changeHandler(frame)
                }
            }
    }

    // MARK: - Private properties

    private let space: CoordinateSpace
    private let observation: GeometryObservationKind
    private let changeHandler: Applicator<CGRect>

    // MARK: - Private nesting

    private enum FrameKey: PreferenceKey {
        static let defaultValue = CGRect()

        static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
    }
}

public extension View {
    /// Read the geometry of the view.
    func observeGeometry(
        space: CoordinateSpace = .global,
        observation: GeometryObservationKind = .all,
        onChange changeHandler: @escaping Applicator<CGRect>
    ) -> some View {
        modifier(GeometryObservingModifier(space: space, observation: observation) { newValue in
            changeHandler(newValue)
        })
    }
}
