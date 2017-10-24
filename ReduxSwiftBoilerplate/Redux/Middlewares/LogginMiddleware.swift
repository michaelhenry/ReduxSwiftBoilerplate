//
//  LogginMiddleware.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

let loggingMiddleware: Middleware<Any> = { dispatch, getState in
    return { next in
        return { action in
            
            Logger.log(.info, items: action)
            return next(action)
        }
    }
}

