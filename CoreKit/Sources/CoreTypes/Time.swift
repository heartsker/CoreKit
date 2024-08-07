//
//  Created by Daniel Pustotin on 19.07.2022.
//

/// A type that represents a time
public struct Time {
    // MARK: - Public nesting

    /// A type that represents a minute
    public typealias Minute = Int
    /// A type that represents an hour
    public typealias Hour = Int

    public enum HourPart {
        case quarter
        case half
        case threeQuarters
    }

    public enum HourRounded {
        case exactHours(Int)
        case hoursWithPart(whole: Int, part: HourPart)
    }

    // MARK: - Constructor

    /// Creates a time from hours and minutes
    public init(_ hours: Hour, _ minutes: Minute) {
        self.hours = hours
        self.minutes = minutes
    }

    /// Creates a time from minutes
    public init(_ minutes: Minute) {
        self = Self(minutes / 60, minutes % 60)
    }

    // MARK: - Public properties

    /// Number of hours
    public var hours: Hour

    /// Number of minutes
    public var minutes: Minute

    /// Returns a normalized time
    /// For example, 1 hour 70 minutes will be converted to 2 hours 10 minutes
    public var normalized: Self {
        Self(hours + minutes / 60, minutes % 60)
    }

    /// Converts a time to minutes
    public var toMinutes: Minute {
        hours * 60 + minutes
    }

    /// Converts a time to hours
    public var toHours: Double {
        Double(toMinutes) / 60
    }

    /// Rounds a time to the nearest hour
    public var rounded: Int {
        Int(toHours.rounded() + 0.5)
    }

    public var smartHourRounded: HourRounded {
        let hourPart: HourPart?
        var wholeHour = false

        switch minutes {
        case 0...6:
            hourPart = nil

        case 7...22:
            hourPart = .quarter

        case 23...37:
            hourPart = .half

        case 38...53:
            hourPart = .threeQuarters

        default:
            hourPart = nil
            wholeHour = true
        }

        guard let hourPart else {
            return .exactHours(hours + (wholeHour ? 1 : 0))
        }

        return .hoursWithPart(whole: hours, part: hourPart)
    }
}

extension Time: AdditiveArithmetic {
    public static var zero: Time {
        Time(0)
    }

    public static func + (lhs: Time, rhs: Time) -> Time {
        Time(lhs.toMinutes + rhs.toMinutes)
    }

    public static func - (lhs: Time, rhs: Time) -> Time {
        Time(lhs.toMinutes - rhs.toMinutes)
    }
}

extension Time: Codable {
    // MARK: - Constructor

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        hours = .zero
        if container.decodeNil() {
            minutes = .zero
        } else {
            minutes = try container.decode(Int.self)
        }

        self = normalized
    }

    // MARK: - Public methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(toMinutes)
    }
}
