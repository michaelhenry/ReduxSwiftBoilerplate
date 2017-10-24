//
//  RoutingReducer.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    
    var routingState = state ?? RoutingState(page: .registration,
                                             rootState:RootState(rootType: .nav,
                                                                 topPages: [.registration],
                                                                 needUpdate: true))
    
    switch action {
    case let routingAction as RoutingAction:
        
        routingState.page = routingAction.target
        routingState.rootState?.needUpdate = false
        
    case let rootAction as SetRootAction:
        routingState.rootState?.rootType = rootAction.rootType
        routingState.rootState?.topPages = rootAction.topPages
        routingState.rootState?.needUpdate = true
    default: break
    }
    
    return routingState
}

