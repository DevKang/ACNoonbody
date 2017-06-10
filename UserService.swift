//
//  UserService.swift
//  ACNoonbody
//
//  Created by DevKang on 2017. 6. 10..
//  Copyright © 2017년 DevKang. All rights reserved.
//

import RxSwift

protocol UserServiceType {
    var current: Observable<User?> { get }
    
    func fetchMe() -> Observable<Void>
}

final class UserService: UserServiceType, ServiceContainer {
    fileprivate let userSubject = ReplaySubject<User?>.create(bufferSize: 1)
    
    lazy var current: Observable<User?> = self.userSubject
        .asObservable()
        .startWith(nil)
        .shareReplay(1)
    
    func fetchMe() -> Observable<Void> {
        return LocalDB.shared.currentUser()
            .do(onNext: { [weak self] user in
                self?.userSubject.onNext(user)
            })
            .map {_ in Void() }
    }
}
