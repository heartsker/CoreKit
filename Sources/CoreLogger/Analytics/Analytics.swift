//
//  Created by Daniel Pustotin on 21.07.2024
//

public class Analytics {
    // MARK: - Constructor

    public init() {}

    // MARK: - Public methods

    func send(_ event: AnalyticsEvent) {
        logger.debug(event)
    }
}
