//
//  AuthenticationActions.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//


import ReSwift

struct LoginAction:Action {
    
    var username:String
    var password:String
}

struct RegisterAction:Action {
    
    var username:String
    var email:String
    var password:String
}

struct SetAuthenticationAction:Action {
    
    var accessKey:String
    var secretKey:String
}

struct LogoutAction:Action {}
