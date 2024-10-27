//
//  Created by Daniel Pustotin on 02.06.2023.
//

import Foundation

public extension Date {
    // MARK: - Public properties

    /// Default date format is 1999-12-31
    static let defaultDateFormat = "yyyy-MM-dd"

    // MARK: - Constructor

    /// Creates `Date` from string using specified date format
    /// - Parameters:
    ///   - dateString: String to create date from
    ///   - dateFormat: Format to apply to string. Default is 31-12-1999
    init?(_ dateString: String, format dateFormat: String = defaultDateFormat) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }

        self = date
    }

    // MARK: - Public methods

    /// Converts date to the `String` using specified date format
    /// - Parameters:
    ///   - dateFormat: Format to convert date to
    /// - Returns: String created from the date
    func string(as dateFormat: String = defaultDateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        return dateFormatter.string(from: self)
    }
}
