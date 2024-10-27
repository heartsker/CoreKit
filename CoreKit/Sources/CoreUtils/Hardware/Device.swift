//
//  Created by Daniel Pustotin on 18.07.2024
//

import UIKit

public enum DeviceType {
    case iPhone
}

public enum Device: CaseIterable {
    case iPhoneXs
    case iPhoneXsMax
    case iPhoneXr
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhoneSEGen2
    case iPhone12Mini
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13Mini
    case iPhone13
    case iPhone13Pro
    case iPhone13ProMax
    case iPhoneSEGen3
    case iPhone14
    case iPhone14Plus
    case iPhone14Pro
    case iPhone14ProMax
    case iPhone15
    case iPhone15Plus
    case iPhone15Pro
    case iPhone15ProMax

    case unknown(String)

    public static var allCases: [Self] {
        [
            .iPhoneXs,
            .iPhoneXsMax,
            .iPhoneXr,
            .iPhone11,
            .iPhone11Pro,
            .iPhone11ProMax,
            .iPhoneSEGen2,
            .iPhone12Mini,
            .iPhone12,
            .iPhone12Pro,
            .iPhone12ProMax,
            .iPhone13Mini,
            .iPhone13,
            .iPhone13Pro,
            .iPhone13ProMax,
            .iPhoneSEGen3,
            .iPhone14,
            .iPhone14Plus,
            .iPhone14Pro,
            .iPhone14ProMax,
            .iPhone15,
            .iPhone15Plus,
            .iPhone15Pro,
            .iPhone15ProMax
        ]
    }

    public static var current: Self {
        #if targetEnvironment(simulator)
        guard let modelName = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] else {
            return .unknown("unknown_simulator")
        }
        #else
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)

        let modelName = mirror.children.reduce(into: "") { partialResult, element in
            guard let value = element.value as? Int8, value != 0 else { return }
            partialResult += String(UnicodeScalar(UInt8(value)))
        }
        #endif

        if let device = Self.allCases.first(where: { $0.modelNames.contains(modelName) }) {
            return device
        } else {
            return .unknown(modelName)
        }
    }

    public var type: DeviceType {
        .iPhone
    }

    public var isBigScreen: Bool {
        switch self {
        case .iPhoneXsMax, .iPhone11ProMax,
             .iPhone12ProMax, .iPhone13ProMax,
             .iPhone14ProMax, .iPhone15ProMax,
             .iPhone15Plus: true
        default: false
        }
    }

    public var isSmallScreen: Bool {
        switch self {
        case .iPhoneSEGen2, .iPhone12Mini,
             .iPhone13Mini, .iPhoneSEGen3: true
        default: false
        }
    }

    public var hasDynamicIsland: Bool {
        switch self {
        case .iPhone14Pro, .iPhone14ProMax,
             .iPhone15, .iPhone15Plus,
             .iPhone15Pro, .iPhone15ProMax: true
        default: false
        }
    }

    public var hasNotch: Bool {
        switch self {
        case .iPhoneSEGen2, .iPhoneSEGen3: false
        default: true
        }
    }
}

// MAKR: - Helpers

private extension Device {
    var modelNames: [String] {
        switch self {
        case .iPhoneXs: ["iPhone11,2"]
        case .iPhoneXsMax: ["iPhone11,4", "iPhone11,6"]
        case .iPhoneXr: ["iPhone11,8"]
        case .iPhone11: ["iPhone12,1"]
        case .iPhone11Pro: ["iPhone12,3"]
        case .iPhone11ProMax: ["iPhone12,5"]
        case .iPhoneSEGen2: ["iPhone12,8"]
        case .iPhone12Mini: ["iPhone13,1"]
        case .iPhone12: ["iPhone13,2"]
        case .iPhone12Pro: ["iPhone13,3"]
        case .iPhone12ProMax: ["iPhone13,4"]
        case .iPhone13Mini: ["iPhone14,4"]
        case .iPhone13: ["iPhone14,5"]
        case .iPhone13Pro: ["iPhone14,2"]
        case .iPhone13ProMax: ["iPhone14,3"]
        case .iPhoneSEGen3: ["iPhone14,6"]
        case .iPhone14: ["iPhone14,7"]
        case .iPhone14Plus: ["iPhone14,8"]
        case .iPhone14Pro: ["iPhone15,2"]
        case .iPhone14ProMax: ["iPhone15,3"]
        case .iPhone15: ["iPhone15,4"]
        case .iPhone15Plus: ["iPhone15,5"]
        case .iPhone15Pro: ["iPhone16,1"]
        case .iPhone15ProMax: ["iPhone16,2"]
        case .unknown(let model): [model]
        }
    }
}
