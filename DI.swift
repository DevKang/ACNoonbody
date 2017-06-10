//
//  DI.swift
//  ACNoonbody
//
//  Created by DevKang on 2017. 6. 10..
//  Copyright © 2017년 DevKang. All rights reserved.
//

import ReactorKit
import Swinject
import SwinjectAutoregistration
import Then

extension Container: Then {}

let DI = Container().then {
    $0.autoregister(UserServiceType.self, initializer: UserService.init).inObjectScope(.container)
}
