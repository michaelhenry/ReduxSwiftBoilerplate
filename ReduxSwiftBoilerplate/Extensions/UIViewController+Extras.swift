//
//  UIViewController+Extras.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit
import SwiftCommonUtils

extension UIViewController:HasIdentifier {}

extension UIViewController {
    
    func pageWillDisappear() {
        if isMovingFromParentViewController {
            
            if let page = Page(rawValue: (navigationController?.viewControllers.last?.identifier)!) {
                mainStore.dispatch(RoutingAction(target: page, type: .pop))
            }
        }
    }
}
