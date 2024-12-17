//
//  Created by Daniel Pustotin on 27.01.2024.
//

extension Array: Loggable where Element: Loggable {
    public var logDescription: String {
        guard !isEmpty else { return "[]" }
        return "[\n" +
            map { "\t" + elementDescription($0) }
            .joined(separator: ",\n") +
            "\n]"
    }

    private func elementDescription(_ element: Element) -> String {
        switch element {
        case let element as Loggable:
            element.logDescription

        default:
            String(describing: element)
        }
    }
}
