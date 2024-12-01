//
//  Created by Daniel Pustotin on 24.12.2022.
//

import CommonTypes
import SwiftUI

public struct URLImageView: View {
    // MARK: - Constructor

    public init(url: String) {
        self.url = url
    }

    // MARK: - Body

    public var body: some View {
        LoadingImage(image)
            .onAppear {
                load()
            }
    }

    // MARK: - Private methods

    private func load() {
        guard let url = URL(string: url) else {
            return
        }
        if let uiImage = ImageCache.shared.get(for: url.absoluteString) {
            self.image = Image(uiImage: uiImage)
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else {
                return
            }

            let task: Task<UIImage?, Never> = Task { @MainActor in
                if let uiImage = UIImage(data: data) {
                    self.image = Image(uiImage: uiImage)
                    // ImageCache.shared.set(for: url.absoluteString, image: uiImage)
                    return uiImage
                }
                return nil
            }

            Task {
                guard let uiImage = await task.value else {
                    return
                }
                ImageCache.shared.set(for: url.absoluteString, image: uiImage)
            }
        }
        .resume()
    }

    // MARK: - Private properties

    @State private var image: Image?

    private let url: URL?
}
