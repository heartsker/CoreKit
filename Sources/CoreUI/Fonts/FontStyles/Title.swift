//
//  Created by Daniel Pustotin on 02.06.2024
//

public extension FontStyle {
    /// Default title font styles
    enum Title {
        // MARK: - Public properties

        /// Medium title font style (17 pt)
        public static var m = FontStyle(.m, weight: .bold)
        /// Large title font style (28 pt)
        public static var l = FontStyle(.l, weight: .bold)
        /// Extra large title font style (34 pt)
        public static var xl = FontStyle(.xl, weight: .bold)
        /// Extra extra large title font style (45 pt)
        public static var xxl = FontStyle(.xxl, weight: .bold)
    }
}
