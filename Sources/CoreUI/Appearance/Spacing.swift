//
//  Created by Daniel Pustotin on 06.06.2022.
//

import CoreGraphics

/// Default spacing constants across the application
public enum Spacing {
    // MARK: - Public properties

    /// Extra extra extra small spacer (4.0 points)
    public static let xxxs: CGFloat = Self.minimalUnit * Self.xxxsMultiplier
    /// Extra extra small spacer (8.0 points)
    public static let xxs: CGFloat = Self.minimalUnit * Self.xxsMultiplier
    /// Extra small spacer (12.0 points)
    public static let xs: CGFloat = Self.minimalUnit * Self.xsMultiplier
    /// Small spacer (16.0 points)
    public static let s: CGFloat = Self.minimalUnit * Self.sMultiplier
    /// Medium spacer (20.0 points)
    public static let m: CGFloat = Self.minimalUnit * Self.mMultiplier
    /// Large spacer (24.0 points)
    public static let l: CGFloat = Self.minimalUnit * Self.lMultiplier
    /// Extra large spacer (32.0 points)
    public static let xl: CGFloat = Self.minimalUnit * Self.xlMultiplier
    /// Extra extra large spacer (48.0 points)
    public static let xxl: CGFloat = Self.minimalUnit * Self.xxlMultiplier
    /// Extra extra extra large spacer (72.0 points)
    public static let xxxl: CGFloat = Self.minimalUnit * Self.xxxlMultiplier

    // MARK: - Private properties

    private static let minimalUnit: CGFloat = 4.0

    private static let xxxsMultiplier: CGFloat = 1.0
    private static let xxsMultiplier: CGFloat = 2.0
    private static let xsMultiplier: CGFloat = 3.0
    private static let sMultiplier: CGFloat = 4.0
    private static let mMultiplier: CGFloat = 5.0
    private static let lMultiplier: CGFloat = 6.0
    private static let xlMultiplier: CGFloat = 8.0
    private static let xxlMultiplier: CGFloat = 12.0
    private static let xxxlMultiplier: CGFloat = 18.0
}
