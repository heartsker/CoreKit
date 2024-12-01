//
//  Created by Daniel Pustotin on 26.02.2024.
//

public protocol AuthSessionHolder {
    var session: AuthSession? { get }

    func setAuthSession(with session: AuthSession?)
}
