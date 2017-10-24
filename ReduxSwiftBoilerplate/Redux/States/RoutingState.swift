//
//  RoutingState.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

struct RootState {
    
    var rootType:RootType
    var topPages:[Page]
    var needUpdate:Bool = true
}

struct RoutingState: StateType {
    
    var page:Page?
    var rootState:RootState?
}

