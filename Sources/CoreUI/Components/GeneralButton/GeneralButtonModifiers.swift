//
//  Created by Daniel Pustotin on 07.01.2025
//

import SwiftUI

private enum GeneralButtonSizeKey: EnvironmentKey {
    static let defaultValue: GeneralButton.Size = .m
}

private enum GeneralButtonShapeKey: EnvironmentKey {
    static let defaultValue: GeneralButton.Shape = .rounded
}

private enum GeneralButtonStyleKey: EnvironmentKey {
    static let defaultValue: GeneralButton.Style = .solid
}

private enum GeneralButtonDisabledKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

private enum GeneralButtonLeftIconKey: EnvironmentKey {
    static let defaultValue: Imaginator.Symbol? = nil
}

private enum GeneralButtonRightIconKey: EnvironmentKey {
    static let defaultValue: Imaginator.Symbol? = nil
}

extension EnvironmentValues {
    var generalButtonSize: GeneralButton.Size {
        get { self[GeneralButtonSizeKey.self] }
        set { self[GeneralButtonSizeKey.self] = newValue }
    }
    var generalButtonShape: GeneralButton.Shape {
        get { self[GeneralButtonShapeKey.self] }
        set { self[GeneralButtonShapeKey.self] = newValue }
    }
    var generalButtonStyle: GeneralButton.Style {
        get { self[GeneralButtonStyleKey.self] }
        set { self[GeneralButtonStyleKey.self] = newValue }
    }
    var generalButtonDisabled: Bool {
        get { self[GeneralButtonDisabledKey.self] }
        set { self[GeneralButtonDisabledKey.self] = newValue }
    }
    var generalButtonLeftIcon: Imaginator.Symbol? {
        get { self[GeneralButtonLeftIconKey.self] }
        set { self[GeneralButtonLeftIconKey.self] = newValue }
    }
    var generalButtonRightIcon: Imaginator.Symbol? {
        get { self[GeneralButtonRightIconKey.self] }
        set { self[GeneralButtonRightIconKey.self] = newValue }
    }
}

public extension View {
    func buttonSize(_ size: GeneralButton.Size) -> some View {
        environment(\.generalButtonSize, size)
    }
    func buttonShape(_ shape: GeneralButton.Shape) -> some View {
        environment(\.generalButtonShape, shape)
    }
    func buttonStyle(_ style: GeneralButton.Style) -> some View {
        environment(\.generalButtonStyle, style)
    }
    func buttonDisabled(_ disabled: Bool) -> some View {
        environment(\.generalButtonDisabled, disabled)
    }
    func leftIcon(_ icon: Imaginator.Symbol?) -> some View {
        environment(\.generalButtonLeftIcon, icon)
    }
    func rightIcon(_ icon: Imaginator.Symbol?) -> some View {
        environment(\.generalButtonRightIcon, icon)
    }
}
