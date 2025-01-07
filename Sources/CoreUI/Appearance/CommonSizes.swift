//
//  Created by Daniel Pustotin on 02.10.2022.
//

import CoreGraphics
import struct SwiftUI.EdgeInsets

public enum CommonSizes {
    /// Navigation bar sizes
    public enum NavigationBar {
        public static let height: CGFloat = 100.0
        public static let heightExpanded: CGFloat = 125.0
    }

    /// Tab bar sizes
    public enum TabBar {
        public static let height: CGFloat = 90.0
        public static let iconWidth: CGFloat = 45.0
        public static let iconHeight: CGFloat = 30.0
    }

    /// Safe Area Insets
    public static let safeAreaInsets: EdgeInsets = .init(top: 45.0, bottom: 34.0)
}
