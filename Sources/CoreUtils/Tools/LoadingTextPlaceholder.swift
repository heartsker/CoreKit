//
//  Created by Daniel Pustotin on 13.06.2023.
//

/// Placeholder to display in loading text view
public enum LoadingTextPlaceholder {
    /// Single symbol
    /// For example, `*`
    case symbol
    /// Single word, about 5 symbols
    /// For example, `apple`
    case word
    /// Two words, about 5 symbols each
    /// For example, `apple apple`
    case twoWords
    /// Three words, about 5 symbols each
    /// For example, `apple apple apple`
    case threeWords
    /// Short sentence
    /// For example, `this is short sentence`
    case shortSentence
    /// Regular sentence
    /// For example, `the quick brown fox jumps over the lazy dog`
    case sentence
    /// Regular paragraph, about 3 sentences
    case paragraph
    /// Long text, about 500 characters long
    case text

    // MARK: - Public properties

    /// Sample string for placeholder
    /// - Note: Do not present the content.
    /// Use only the `.count` property or use shimmering over the text
    public var sampleString: String {
        switch self {
        case .symbol:
            return "*"
        case .word:
            return "apple"
        case .twoWords:
            return "apple apple"
        case .threeWords:
            return "apple apple apple"
        case .shortSentence:
            return "this is short sentence"
        case .sentence:
            return "the quick brown fox jumps over the lazy dog"
        case .paragraph:
            return """
            the quick brown fox jumps over the lazy dog
            the quick brown fox jumps over the lazy dog
            the quick brown fox jumps over the lazy dog
            """
        case .text:
            return String(repeating: "*", count: 500)
        }
    }
}
