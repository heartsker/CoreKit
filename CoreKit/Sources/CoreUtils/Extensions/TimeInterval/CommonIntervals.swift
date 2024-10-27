//
//  Created by Daniel Pustotin on 14.11.2022.
//

import Foundation

public extension TimeInterval {
    // MARK: - Type properties

    /// 0.001 second
    static let millisecond: TimeInterval = 0.001
    /// 1 second
    static let second: TimeInterval = 1.0
    /// 10 second
    static let tenSeconds: TimeInterval = 10 * .second
    /// 60 seconds
    static let minute: TimeInterval = 60 * .second
    /// 5 minutes
    static let fiveMinutes: TimeInterval = 5.0 * .minute
    /// 10 minutes
    static let tenMinutes: TimeInterval = 10.0 * .minute
    /// 15 minutes
    static let fifteenMinutes: TimeInterval = 15.0 * .minute * 15
    /// 60 minutes
    static let hour: TimeInterval = 60 * .minute
    /// 12 hours
    static let halfDay: TimeInterval = 12.0 * .hour
    /// 24 hours
    static let day: TimeInterval = 24.0 * .hour
    /// 7 days
    static let week: TimeInterval = 7.0 * .day
    /// 14 days
    static let twoWeeks: TimeInterval = 14 * .day
    /// 30 days
    static let month: TimeInterval = 30.0 * .day
}
