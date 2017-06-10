//
//  MainViewReactor.swift
//  ACNoonbody
//
//  Created by DevKang on 2017. 6. 10..
//  Copyright © 2017년 DevKang. All rights reserved.
//

import ReactorKit
import RxSwift
import RxCocoa


final class MainViewReactor: Reactor, ServiceContainer {
    enum Action {
        case fetch
    }
    
    enum Mutation {
        case setName(name:String?)
    }
    
    struct State {
        var name:String?
    }
    
    let initialState = State()
    
    init() {
        _ = self.state
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .fetch:
            return self.userService.fetchMe()
                .flatMap { self.userService.current }
                .map { Mutation.setName(name: $0?.name) }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setName(let name):
            state.name = name
            break
        }
        return state
    }
}
