//
//  Created by Daniel Pustotin on 02.06.2024
//

public extension FontStyle {
    /// Default title font styles
    @MainActor
    enum Title {
        // MARK: - Public properties

        /// Medium title font style (17 pt)
        public static let m = FontStyle(.m, weight: .bold)
        /// Large title font style (22 pt)
        public static let l = FontStyle(.l, weight: .bold)
        /// Extra large title font style (28 pt)
        public static let xl = FontStyle(.xl, weight: .bold)
        /// Extra extra large title font style (34 pt)
        public static let xxl = FontStyle(.xxl, weight: .bold)
    }
}
