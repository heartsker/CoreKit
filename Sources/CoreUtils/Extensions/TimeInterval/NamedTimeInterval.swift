//
//  Created by Daniel Pustotin on 19.10.2023.
//

import Foundation

public struct NamedTimeInterval: Hashable, Codable, Sendable {
    // MARK: - Public properties

    public static let zero = Self(name: "zero", interval: .zero)
    public static let millisecond = Self(name: "millisecond", interval: .millisecond)
    public static let second = Self(name: "second", interval: .second)
    public static let tenSeconds = Self(name: "10 seconds", interval: .tenSeconds)
    public static let minute = Self(name: "minute", interval: .minute)
    public static let fiveMinutes = Self(name: "5 minutes", interval: .fiveMinutes)
    public static let tenMinutes = Self(name: "10 minutes", interval: .tenMinutes)
    public static let fifteenMinutes = Self(name: "15 minutes", interval: .fifteenMinutes)
    public static let hour = Self(name: "hour", interval: .hour)
    public static let halfDay = Self(name: "half day", interval: .halfDay)
    public static let day = Self(name: "day", interval: .day)
    public static let week = Self(name: "week", interval: .week)
    public static let twoWeeks = Self(name: "2 weeks", interval: .twoWeeks)
    public static let month = Self(name: "month", interval: .month)

    public static let allIntervals: [Self] = [
        zero,
        millisecond,
        second,
        tenSeconds,
        minute,
        fiveMinutes,
        tenMinutes,
        fifteenMinutes,
        hour,
        halfDay,
        day,
        week,
        twoWeeks,
        month
    ]

    public let name: String
    public let interval: TimeInterval

    // MARK: - Constructor

    private init(name: String, interval: TimeInterval) {
        self.name = name
        self.interval = interval
    }

    init?(interval: TimeInterval) {
        guard let namedInterval = interval.namedInterval else {
            return nil
        }
        self = namedInterval
    }
}

extension NamedTimeInterval: CustomStringConvertible {
    public var description: String {
        name
    }
}

extension NamedTimeInterval: RawRepresentable {
    public var rawValue: String {
        interval.rawValue
    }

    public init?(rawValue: String) {
        guard let interval = TimeInterval(rawValue: rawValue) else {
            return nil
        }
        self.init(interval: interval)
    }
}

extension NamedTimeInterval: Loggable {
    public var logDescription: String {
        description
    }
}

public extension TimeInterval {
    var namedInterval: NamedTimeInterval? {
        switch self {
        case .zero: .zero
        case .millisecond: .millisecond
        case .second: .second
        case .tenSeconds: .tenSeconds
        case .minute: .minute
        case .fiveMinutes: .fiveMinutes
        case .tenMinutes: .tenMinutes
        case .fifteenMinutes: .fifteenMinutes
        case .hour: .hour
        case .halfDay: .halfDay
        case .day: .day
        case .week: .week
        case .twoWeeks: .twoWeeks
        case .month: .month
        default: nil
        }
    }
}
