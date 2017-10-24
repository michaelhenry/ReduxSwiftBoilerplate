//
//  RoutingActions.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

enum RoutingActionType {
    
    case push
    case pop
    case present
    case dismiss
}

struct RoutingAction: Action {
    
    let target: Page
    var type:RoutingActionType
}

enum RootType {
    
    case nav
    case tab
}

struct SetRootAction:Action {
    
    let rootType:RootType
    let topPages:[Page]
    
}
