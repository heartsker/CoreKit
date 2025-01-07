//
//  Created by Daniel Pustotin on 25.12.2024
//

import SwiftUI
import CoreLocalizer

public struct TextFieldListItem: View {
    private let prompt: String
    @Binding private var text: String

    @FocusState private var isFocused: Bool

    public var body: some View {
        TextField(
            prompt,
            text: $text
        )
        .focused($isFocused)
        .toolbar {
            if isFocused {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(Strings.done) {
                        isFocused = false
                    }
                }
            }
        }
    }

    public init(prompt: String, text: Binding<String>) {
        self.prompt = prompt
        _text = text
    }
}
