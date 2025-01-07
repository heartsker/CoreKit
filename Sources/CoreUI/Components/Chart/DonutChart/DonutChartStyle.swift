//
//  Created by Daniel Pustotin on 18.12.2024
//

@preconcurrency import Charts
import SwiftUI

public struct DonutChartSelectedItemStyle: Sendable {
    var innerRadius: MarkDimension
    var outerRadius: MarkDimension
    var deselectedOpacity: Double
}

public struct DonutChartCustomLegendStyle: Sendable, Equatable {
    var position: AnnotationPosition
    var alignment: Alignment
    var spacing: CGFloat
}

public enum DonutChartLegendStyle: Sendable, Equatable {
    case `default`
    case custom(DonutChartCustomLegendStyle)
    case hidden
}

public protocol DonutChartStyleRepresentable: Sendable {
    var innerRadius: MarkDimension { get }
    var outerRadius: MarkDimension { get }
    var inset: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var legendStyle: DonutChartLegendStyle { get }
    var selectedItemStyle: DonutChartSelectedItemStyle? { get }
}

struct DonutChartStyle: DonutChartStyleRepresentable {
    var innerRadius: MarkDimension = .ratio(0.618)
    var outerRadius: MarkDimension = .ratio(0.93)
    var inset: CGFloat = 1.8
    var cornerRadius: CGFloat = Spacing.xxs
    var legendStyle: DonutChartLegendStyle = .default
    var selectedItemStyle: DonutChartSelectedItemStyle? = DonutChartSelectedItemStyle(
        innerRadius: .ratio(0.54),
        outerRadius: .ratio(1.0),
        deselectedOpacity: 0.7
    )
}
