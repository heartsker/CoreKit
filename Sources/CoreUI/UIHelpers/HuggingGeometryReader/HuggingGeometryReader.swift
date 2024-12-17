//
//  Created by Daniel Pustotin on 13.06.2023.
//

import CoreTypes
import SwiftUI

/// A GeometryReader that has hugging sizing behavior
public struct HuggingGeometryReader<Content: View>: View {
    // MARK: - Constructor

    public init(
        space: CoordinateSpace = .global,
        observation: GeometryObservationKind = .all,
        onChange changeHandler: Applicator<CGRect>? = nil,
        @ViewBuilder content: @escaping Mapper<CGRect, Content>
    ) {
        self.space = space
        self.observation = observation
        self.changeHandler = changeHandler
        self.content = content
    }

    // MARK: - Body

    public var body: some View {
        content(frame)
            .observeGeometry(space: space, observation: observation) { newValue in
                frame = newValue
                changeHandler?(newValue)
            }
    }

    // MARK: - Private properties

    @State private var frame = CGRect()

    private let space: CoordinateSpace
    private let observation: GeometryObservationKind
    private let changeHandler: Applicator<CGRect>?
    private let content: Mapper<CGRect, Content>
}
