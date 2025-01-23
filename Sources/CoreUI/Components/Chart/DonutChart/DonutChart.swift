//
//  Created by Daniel Pustotin on 18.12.2024
//

import Charts
import SwiftUI

@available(iOS 17.0, *)
public struct DonutChart: View {
    // MARK: - Public nesting

    public typealias LegendContentBuilder = SendableEmitter<AnyView?>

    // MARK: - Private properties

    @State var items: [DonutChartItem]
    @Binding var selectedItem: DonutChartItem?

    @State private var selectedValue: Double?
    @Environment(\.donutChartStyle) private var style: DonutChartStyleRepresentable

    private var ranges: [Range<Double>] {
        let values = prefixSum
        return (0..<items.count).map { values[$0]..<values[$0 + 1] }
    }

    private var prefixSum: [Double] {
        var prefixSum = [.zero] + items.map(\.value)
        for i in 0..<items.count {
            prefixSum[i + 1] += prefixSum[i]
        }
        return prefixSum
    }

    public var body: some View {
        Chart(items) { item in
            let isSelected = item == selectedItem
            let isDeselected = selectedItem != nil && !isSelected
            let innerRatio = if isSelected, let selectedItemStyle = style.selectedItemStyle {
                selectedItemStyle.innerRadius
            } else {
                style.innerRadius
            }
            let outerRatio = if isSelected, let selectedItemStyle = style.selectedItemStyle {
                selectedItemStyle.outerRadius
            } else {
                style.outerRadius
            }

            SectorMark(
                angle: .value(Const.valueKey, item.value),
                innerRadius: innerRatio,
                outerRadius: outerRatio,
                angularInset: style.inset
            )
            .cornerRadius(style.cornerRadius)
            .foregroundStyle(by: .value(Const.itemKey, item.label))
            .opacity(isDeselected ? style.selectedItemStyle?.deselectedOpacity ?? 1 : 1)
        }
        .chartAngleSelection(value: $selectedValue)
        .scaledToFit()
        .onChange(of: selectedValue) { oldValue, newValue in
            guard let selectedValue,
                  let selectedIndex = ranges.firstIndex(where: { $0.contains(selectedValue) }) else {
                selectedItem = nil
                return
            }

            selectedItem = items[selectedIndex]
        }
    }

    // MARK: - Constructor

    public init(items: [DonutChartItem], selectedItem: Binding<DonutChartItem?>) {
        self.items = items
        _selectedItem = selectedItem
    }
}

// MARK: - Const

@available(iOS 17.0, *)
private extension DonutChart {
    enum Const {
        static let valueKey = "value"
        static let itemKey = "item"
    }
}


@available(iOS 17.0, *)
#Preview {
    @Previewable @State var selectedItem: DonutChartItem? = nil

    VStack {
        DonutChart(
            items: [
                DonutChartItem(label: "First", value: 0.3),
                DonutChartItem(label: "other", value: 0.4),
                DonutChartItem(label: "Second", value: 0.7),
                DonutChartItem(label: "a", value: 0.7),
                DonutChartItem(label: "b", value: 0.7),
                DonutChartItem(label: "c", value: 0.7)
            ],
            selectedItem: $selectedItem
        )
        .donutChartStyle(DonutChartStyle(legendStyle: .default))
    }
}
