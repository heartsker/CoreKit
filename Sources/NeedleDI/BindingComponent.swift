//
//  Created by Daniel Pustotin on 25.12.2023.
//

public protocol BindingComponentProtocol: Dependency {}

open class BindingComponent: Component<BindingComponentProtocol> {
    // MARK: - Constructor

    public override init(parent: Scope) {
        super.init(parent: parent)

        bind()
    }

    // MARK: - Public methods

    open func bind() {}
}
