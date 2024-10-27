//
//  Created by Daniel Pustotin on 02.07.2024
//

public enum ImageFormat {
    case png
    case jpeg
    case gif
    case tiff
    case unknown
}

extension Data {
    // MARK: - Public properties

    var imageFormat: ImageFormat? {
        var buffer: [UInt8] = Array(repeating: 0, count: 1)
        copyBytes(to: &buffer, count: 1)
        // swiftlint:disable switch_case_alignment
        return switch buffer {
        case ImageHeaderData.png: .png
        case ImageHeaderData.jpeg: .jpeg
        case ImageHeaderData.gif: .gif
        case ImageHeaderData.tiff1, ImageHeaderData.tiff2: .tiff
        default: nil
        }
        // swiftlint:enable switch_case_alignment
    }

    // MARK: - Private nesting

    private enum ImageHeaderData {
        static let png: [UInt8] = [0x89]
        static let jpeg: [UInt8] = [0xFF]
        static let gif: [UInt8] = [0x47]
        static let tiff1: [UInt8] = [0x49]
        static let tiff2: [UInt8] = [0x4D]
    }
}
