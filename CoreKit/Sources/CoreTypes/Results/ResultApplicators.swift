//
//  Created by Daniel Pustotin on 07.08.2024.
//

public typealias GenericResultApplicator<T> = Applicator<GenericResult<T>>
public typealias ResultApplicator = GenericResultApplicator<Void>
public typealias ThrowableGenericResultApplicator<T> = ThrowableApplicator<GenericResult<T>>
