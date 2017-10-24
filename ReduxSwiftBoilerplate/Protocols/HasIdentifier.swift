//
//  HasIdentifier.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

protocol HasIdentifier {
    
    static var identifier:String { get }
    var identifier:String { get }
}

extension HasIdentifier {
    
    static var identifier:String {
        
        return String(describing: self)
    }
    
    var identifier:String {
        
        return String(describing: type(of: self))
    }
}



