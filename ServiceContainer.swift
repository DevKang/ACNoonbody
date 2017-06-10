//
//  ServiceContainer.swift
//  ACNoonbody
//
//  Created by DevKang on 2017. 6. 10..
//  Copyright © 2017년 DevKang. All rights reserved.
//

protocol ServiceContainer { }

extension ServiceContainer {
    var userService: UserServiceType { return DI.resolve(UserServiceType.self)! }
}
