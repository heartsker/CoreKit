//
//  Created by Daniel Pustotin on 24.12.2024
//

public extension Imaginator.Symbol {
    /// Symbols with numbers
    enum Number {
        /// Symbol of 􀀻, 􀀽, 􀀿, ..., 􀚼
        case circle(number: Int, fill: Bool)
        /// Symbol of 􀃋, 􀃍, 􀃏, ..., 􀛢
        case square(number: Int, fill: Bool)
    }
}
