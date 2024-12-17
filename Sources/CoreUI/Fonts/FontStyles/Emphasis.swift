//
//  Created by Daniel Pustotin on 02.06.2024
//


public extension FontStyle {
    /// Default text font styles
    @MainActor enum Emphasis {
        // MARK: - Public properties

        /// Extra extra small emphasis font style (10 pt)
        public static let xxs = FontStyle(.xxs, weight: .semibold)
        /// Extra small emphasis font style (13 pt)
        public static let xs = FontStyle(.xs, weight: .semibold)
        /// Small emphasis font style (15 pt)
        public static let s = FontStyle(.s, weight: .semibold)
        /// Medium emphasis font style (17 pt)
        public static let m = FontStyle(.m, weight: .semibold)
    }
}
