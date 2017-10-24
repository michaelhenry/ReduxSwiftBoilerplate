//
//  Page.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import Foundation

enum Page:String {
    
    case login = "LoginViewController"
    case registration = "RegistrationViewController"
    case forgotPassword = "ForgotPasswordViewController"
    case feed = "FeedViewController"
    case notifications = "NotificationsViewController"
    case settings = "SettingsViewController"
}

extension Page {
    
    var storyboardId:String {
        return rawValue
    }
    
    var storyboardName:String {
        
        switch(self) {
        case .login,
             .registration,
             .forgotPassword:
            
            return "RegLogin"
        default:
            return "Main"
        }
    }
}
