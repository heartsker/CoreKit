//
//  Created by Daniel Pustotin on 10.07.2022.
//

import Foundation
import os

/// Logs messages
public let logger = Logger.shared // swiftlint:disable:this prefixed_toplevel_constant

/// Logs messages
final public class Logger: Sendable {
    // MARK: - Public properties

    /// Shared instance of ``Logger``
    public static let shared = Logger()

    // MARK: - Public methods

    /// Logs a message
    /// - Parameters:
    ///   - object: The object to log
    public func debug<T>(
        _ object: T?,
        threadInfo withThreadInfo: Bool = false
    ) where T: Loggable {
        log(
            .debug,
            message: object?.logDescription ?? T.description,
            info: object?.info ?? [:],
            threadInfo: withThreadInfo
        )
    }

    /// Logs a warning message
    /// - Parameters:
    ///   - object: The object to log
    public func warning<T>(
        _ object: T
    ) where T: Loggable {
        log(
            .warning,
            message: object.logDescription,
            info: object.info
        )
    }

    /// Logs an error message
    /// - Parameters:
    ///   - error: The error to log
    ///   - file: The file where the message is logged
    ///   - function: The function where the message is logged
    ///   - line: The line where the message is logged
    public func error(
        _ object: Loggable,
        error: Error,
        file: String = #fileID,
        function: String = #function,
        line: UInt = #line
    ) {
        log(.warning, message: error.description, file: file, function: function, line: line)
    }

    /// Logs a critical message
    /// - Parameters:
    ///   - object: The object to log
    ///   - error: Occurred error
    ///   - file: The file where the message is logged
    ///   - function: The function where the message is logged
    ///   - line: The line where the message is logged
    public func critical(
        _ object: Loggable,
        error: Error,
        file: String = #fileID,
        function: String = #function,
        line: UInt = #line
    ) {
        let info = ["error": error.description]
        log(.critical, message: object.logDescription, info: info, file: file, function: function, line: line)
    }
}

// MARK: - Private methods

private extension Logger {
    private func log(
        _ level: LogLevel,
        message: String,
        info: LoggableInfo = [:],
        threadInfo withThreadInfo: Bool = false,
        file: String? = nil,
        function: String? = nil,
        line: UInt? = nil
    ) {
        #if DEBUG
        let logString = makeLogString(
            level,
            message: message,
            info: info,
            threadInfo: withThreadInfo,
            file: file,
            function: function,
            line: line
        )

        // swiftlint:disable:next print_call
        print(logString)
        #endif
    }

    private func makeLogString(
        _ level: LogLevel,
        message: String,
        info: LoggableInfo = [:],
        threadInfo withThreadInfo: Bool = false,
        file: String? = nil,
        function: String? = nil,
        line: UInt? = nil
    ) -> String {
        var logString = "\(level.emoji) \(level.name.uppercased())\n"

        if withThreadInfo {
            logString += threadInfo()
        }

        if let file {
            logString += "\tFile: `\(file)`\n"
        }
        if let function {
            logString += "\tFunc: `\(function)`\n"
        }
        if let line {
            logString += "\tLine: `\(line)`\n"
        }

        logString += message + "\n"

        if !info.isEmpty {
            logString += "Info:\n"
            logString += info.prettyFormatted
                .split(separator: "\n")
                .map { "\t\($0)" }
                .joined(separator: "\n") + "\n"
        }

        return logString
    }
}
