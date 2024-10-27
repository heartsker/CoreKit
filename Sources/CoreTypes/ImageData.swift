//
//  Created by Daniel Pustotin on 21.01.2023.
//

import Foundation

/// Struct for storing image data with corresponding identifier
public struct ImageData {
    // MARK: - Public properties

    /// Image data
    public private(set) var data: Data?
    /// Image identifier
    public let id: UID

    public var isEmpty: Bool {
        data == nil
    }

    // MARK: - Constructor

    /// Creates ``ImageData`
    /// - Parameters:
    ///   - data: Image data
    ///   - id: Image identifier
    public init(_ data: Data? = nil, id: UID = UID()) {
        self.data = data
        self.id = id
    }

    // MARK: - Public methods

    public func updated(with data: Data?) -> Self {
        Self(data, id: id)
    }
}

extension ImageData: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(data)
    }
}

extension ImageData: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard !lhs.id.isEmpty || !rhs.id.isEmpty else {
            return lhs.id == rhs.id && lhs.data == rhs.data
        }
        return lhs.id == rhs.id
    }
}

extension ImageData: Codable {
    // MARK: - Constructor

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let data = try container.decodeIfPresent(Data.self, forKey: .data)
        let id = try container.decodeIfPresent(String.self, forKey: .data) ?? UID()

        self.init(data, id: id)
    }

    // MARK: - Public methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(data, forKey: .data)

        if id != UID() {
            try container.encode(id, forKey: .id)
        }
    }

    // MARK: - Private nesting

    private enum CodingKeys: CodingKey {
        case data
        case id
    }
}

extension ImageData: Loggable {
    public var info: LoggableInfo {
        [
            "id": id
        ]
    }
}
