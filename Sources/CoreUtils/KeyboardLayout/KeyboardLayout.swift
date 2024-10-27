//
//  Created by Daniel Pustotin on 30.08.2022.
//

/// Represents a keyboard symbol
public typealias Keycap = Character

/// Represents a keyboard layout
public protocol KeyboardLayoutRepresentable {
    // MARK: - Public properties

    /// Keyboard layout keycaps
    static var keycaps: [[Keycap]] { get }

    // MARK: - Public methods

    /// Checks if two keycaps are close to each other on the keyboard
    static func areClose(_ lhs: Keycap, _ rhs: Keycap) -> Bool
}

// MARK: - Default implementation

public extension KeyboardLayoutRepresentable {
    // MARK: - Public methods

    /// Checks if two keycaps are close to each other on the keyboard
    static func areClose(_ lhs: Keycap, _ rhs: Keycap) -> Bool {
        guard let idx1Row = keycaps.firstIndex(where: { $0.contains(lhs) }),
              let idx1Column = keycaps[idx1Row].firstIndex(where: { lhs == $0 }) else {
            return false
        }
        let idx1 = (row: idx1Row, column: idx1Column)

        guard let idx2Row = keycaps.firstIndex(where: { $0.contains(rhs) }),
              let idx2Column = keycaps[idx2Row].firstIndex(where: { rhs == $0 }) else {
            return false
        }
        let idx2 = (row: idx2Row, column: idx2Column)

        return abs(idx1.row - idx2.row) <= 1 && abs(idx1.column - idx2.column) <= 1
    }
}
