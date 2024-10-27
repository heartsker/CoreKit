//
//  Created by Daniel Pustotin on 28.08.2022.
//

import Dispatch

public extension DispatchTime {
    // MARK: - Public nesting

    enum Interval: Double {
        case second = 1_000_000_000.0
        case millisecond = 1_000_000.0
        case microsecond = 1_000.0
        case nanosecond = 1.0
    }

    // MARK: - Public methods

    /// Translates the time to the specified measurement interval
    /// - Parameter interval: The measurement interval
    /// - Returns: The translated time
    func translate(in interval: Interval = .second) -> Double {
        (Double(uptimeNanoseconds) / interval.rawValue * 100.0).rounded() / 100.0
    }

    /// Returns the time between two given times
    /// - Parameters:
    ///   - lhs: The first time
    ///   - rhs: The second time
    /// - Returns: The time between the two times
    static func - (lhs: DispatchTime, rhs: DispatchTime) -> DispatchTime {
        DispatchTime(uptimeNanoseconds: lhs.uptimeNanoseconds - rhs.uptimeNanoseconds)
    }
}

extension DispatchTime: CustomStringConvertible {
    public var description: String {
        translate(in: .millisecond).description + " ms"
    }
}

extension DispatchTime: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let nanoseconds = try container.decode(UInt64.self, forKey: .nanoseconds)
        self.init(uptimeNanoseconds: nanoseconds)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(uptimeNanoseconds, forKey: .nanoseconds)
    }

    // MARK: - Private nesting

    private enum CodingKeys: CodingKey {
        case nanoseconds
    }
}
