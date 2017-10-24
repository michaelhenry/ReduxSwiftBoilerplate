//
//  AppReducer.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    
    let state = AppState(
        routingState: routingReducer(action: action, state: state?.routingState),
        authenticationState: authenticationReducer(action: action, state: state?.authenticationState)
    )
    return state
}

