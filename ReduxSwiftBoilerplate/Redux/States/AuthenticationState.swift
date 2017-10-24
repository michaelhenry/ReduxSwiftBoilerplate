//
//  AuthenticationState.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

enum AuthenticationState: StateType {
    
    case notLoggedIn
    case loading
    case loggedIn(accessKey:String, secretKey:String)
    case loggedOut
}
