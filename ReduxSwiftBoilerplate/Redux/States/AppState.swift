//
//  AppState.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    
    var routingState:RoutingState
    var authenticationState:AuthenticationState
}
