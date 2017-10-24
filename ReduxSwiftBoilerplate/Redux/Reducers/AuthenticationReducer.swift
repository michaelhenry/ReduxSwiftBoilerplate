//
//  AuthenticationReducer.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

func authenticationReducer(action: Action, state: AuthenticationState?) -> AuthenticationState {
    
    var state = state ?? .notLoggedIn
    
    switch action {
    case let setAuthentication as SetAuthenticationAction:
        state = .loggedIn(accessKey: setAuthentication.accessKey, secretKey: setAuthentication.secretKey)
        
    case _ as LogoutAction:
        state = .notLoggedIn
        
    case _ as LoginAction:
        state = .loading
        
    case _ as RegisterAction:
        
        state = .loading
    default: break
    }
    return state
}
