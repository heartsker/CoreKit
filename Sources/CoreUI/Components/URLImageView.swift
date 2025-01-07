//
//  Created by Daniel Pustotin on 24.12.2022.
//

import CoreTypes
import SwiftUI

public struct URLImageView: View {
    // MARK: - Constructor

    public init(url: URL?) {
        self.url = url
    }

    // MARK: - Body

    public var body: some View {
        LoadingImage(image)
            .onAppear {
                Task {
                    await load()
                }
            }
    }

    // MARK: - Private methods

    private func load() async {
        guard let url else { return }
        if let uiImage = await ImageCache.shared.get(for: url.absoluteString) {
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
                    await ImageCache.shared.set(for: url.absoluteString, image: uiImage)
                    return uiImage
                }
                return nil
            }

            Task {
                guard let uiImage = await task.value else {
                    return
                }
                await ImageCache.shared.set(for: url.absoluteString, image: uiImage)
            }
        }
        .resume()
    }

    // MARK: - Private properties

    @State private var image: Image?

    private let url: URL?
}
