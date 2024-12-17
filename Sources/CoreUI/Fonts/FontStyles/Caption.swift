//
//  Created by Daniel Pustotin on 02.06.2024
//

public extension FontStyle {
    /// Default caption font styles
    enum Caption {
        // MARK: - Public properties

        /// Extra extra small text font style (10 pt)
        public static let xxs = FontStyle(.xxs, weight: .light)
        /// Extra small text font style (13 pt)
        public static let xs = FontStyle(.xs, weight: .light)
        /// Small text font style (15 pt)
        public static let s = FontStyle(.s, weight: .light)
        /// Medium text font style (17 pt)
        public static let m = FontStyle(.m, weight: .light)
    }
}
