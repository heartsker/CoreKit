//
//  Created by Daniel Pustotin on 19.12.2024
//

@available(iOS 17.0, *)
public struct DonutChartItem: Identifiable, Equatable, Sendable {
    public let id = UUID()
    public let label: String
    public let value: Double

    public init(label: String, value: Double) {
        self.label = label
        self.value = value
    }
}
