//
//  APIActionCreator.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

struct APIActionCreator {
    
    func login(username:String, password:String) -> Store<AppState>.AsyncActionCreator {
        
        return { state, store, callback in
            // Assume we send login request to the server
            store.dispatch(LoginAction(username: username,
                                       password: password))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                callback { _, _ in
                    // assume that we get result from the server,
                    // set the client credentials
                    store.dispatch(SetAuthenticationAction(accessKey: "some_access_key", secretKey: "some_secret_key"))
                    
                    // Update the pages
                    return SetRootAction(rootType: .tab, topPages: [.feed, .notifications, .settings])
                }
            }
        }
    }
    
    func logout() -> Store<AppState>.ActionCreator {
        
        return { state, store in
            
            store.dispatch(LogoutAction())
            store.dispatch(SetRootAction(rootType: .nav, topPages: [.registration]))
            return nil
        }
    }
    
    func register(username:String, email:String, password:String) -> Store<AppState>.AsyncActionCreator {
        
        return { state, store, callback in
            
            // Assume we send registration process to the server
            store.dispatch(RegisterAction(username: username,
                                          email: email,
                                          password: password))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                callback { _, _ in
                    // assume that we get result from the server,
                    // set the client credentials
                    
                    store.dispatch(SetAuthenticationAction(accessKey: "some_access_key", secretKey: "some_secret_key"))
                    
                    // Update the pages
                    return SetRootAction(rootType: .tab, topPages: [.feed, .notifications, .settings])
                }
            }
        }
    }
    
}
