//
//  Created by Daniel Pustotin on 21.07.2024
//

extension LoggableInfo {
    var prettyFormatted: String {
        var formatted = ""
        for element in sorted(by: { $0.key < $1.key }) {
            if let value = element.value {
                formatted += element.key.capitalized + ": `" + value.description + "`\n"
            }
        }
        return formatted
    }
}
