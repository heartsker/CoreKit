//
//  Created by Daniel Pustotin on 02.06.2024
//

public extension FontStyle {
    /// Default text font styles
    @MainActor
    enum Text {
        // MARK: - Public properties

        /// Extra extra small text font style (10 pt)
        public static let xxs = FontStyle(.xxs)
        /// Extra small text font style (13 pt)
        public static let xs = FontStyle(.xs)
        /// Small text font style (15 pt)
        public static let s = FontStyle(.s)
        /// Medium text font style (17 pt)
        public static let m = FontStyle(.m)
    }
}
