//
//  MainStore.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import ReSwift

var mainStore = Store<AppState>(reducer: appReducer,
                                state: nil,
                                middleware: [loggingMiddleware])

