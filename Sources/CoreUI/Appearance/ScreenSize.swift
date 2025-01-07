//
//  Created by Daniel Pustotin on 09.07.2022.
//

import CoreGraphics
import class UIKit.UIScreen

/// Screen size constants
@MainActor
public enum ScreenSize {
    public static let width: CGFloat = UIScreen.main.bounds.width
    public static let height: CGFloat = UIScreen.main.bounds.height
}
