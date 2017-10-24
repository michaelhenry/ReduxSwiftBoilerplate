//
//  Logger.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/25.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import Foundation

final class Logger {
    
    enum LogType {
        case verbose
        case debug
        case info
        case warning
        case error
        
        var prefix:String {
            switch (self) {
            case .verbose:
            return "👉🏻"
            case .debug:
            return "🐞"
            case .info:
            return "🔆"
            case .warning:
            return "⚠️"
            case .error:
            return "🚫"
            }
        }
    }
    
    
    
    static func log(_ logType:LogType, items:Any...) {
        
        debugPrint("\(logType.prefix) \(items)")
    }
}
