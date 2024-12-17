//
//  Created by Daniel Pustotin on 30.10.2024
//

public typealias Reducer<S, A: ActionRepresentable> = (inout S, A) -> Void
