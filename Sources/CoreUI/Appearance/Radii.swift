//
//  Created by Daniel Pustotin on 23.12.2024
//

import CoreGraphics

/// Default radii constants across the application
public enum Radii {
    // MARK: - Public properties

    /// Extra extra extra small radius (4.0 points)
    public static let xxxs: CGFloat = Self.minimalUnit * Self.xxxsMultiplier
    /// Extra extra small radius (8.0 points)
    public static let xxs: CGFloat = Self.minimalUnit * Self.xxsMultiplier
    /// Extra small radius (12.0 points)
    public static let xs: CGFloat = Self.minimalUnit * Self.xsMultiplier
    /// Small radius (16.0 points)
    public static let s: CGFloat = Self.minimalUnit * Self.sMultiplier
    /// Medium radius (20.0 points)
    public static let m: CGFloat = Self.minimalUnit * Self.mMultiplier
    /// Large radius (24.0 points)
    public static let l: CGFloat = Self.minimalUnit * Self.lMultiplier
    /// Extra large radius (32.0 points)
    public static let xl: CGFloat = Self.minimalUnit * Self.xlMultiplier
    /// Extra extra large radius (48.0 points)
    public static let xxl: CGFloat = Self.minimalUnit * Self.xxlMultiplier
    /// Extra extra extra large radius (72.0 points)
    public static let xxxl: CGFloat = Self.minimalUnit * Self.xxxlMultiplier
    /// Infinite radius
    public static let infinity: CGFloat = .infinity

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
