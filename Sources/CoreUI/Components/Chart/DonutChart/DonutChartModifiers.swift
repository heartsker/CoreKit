//
//  Created by Daniel Pustotin on 19.12.2024
//

import SwiftUI

private enum DonutChartStyleKey: EnvironmentKey {
    static let defaultValue: DonutChartStyleRepresentable = DonutChartStyle()
}

@available(iOS 17.0, *)
extension EnvironmentValues {
    var donutChartStyle: DonutChartStyleRepresentable {
        get { self[DonutChartStyleKey.self] }
        set { self[DonutChartStyleKey.self] = newValue }
    }
}

@available(iOS 17.0, *)
public extension View {
    func donutChartStyle(_ style: DonutChartStyleRepresentable) -> some View {
        environment(\.donutChartStyle, style)
    }
}
