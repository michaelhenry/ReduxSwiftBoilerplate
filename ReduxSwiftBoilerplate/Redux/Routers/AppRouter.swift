//
//  AppRouter.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//


import ReSwift

final class AppRouter {
    
    let window:UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        mainStore.subscribe(self) {
            $0.select {
                ($0.routingState.page!,
                 $0.routingState.rootState!)
            }
        }
    }
    
    fileprivate func pushViewController(storyboardId:String,
                                        storyboardName:String,
                                        animated: Bool,
                                        fromNavController:UINavigationController) {
        let viewController = instantiateViewController(storyboardId: storyboardId,
                                                       storyboardName: storyboardName)
        let newViewControllerType = type(of: viewController)
        if let currentVc = fromNavController.topViewController {
            let currentViewControllerType = type(of: currentVc)
            if currentViewControllerType == newViewControllerType {
                return
            }
        }
        
        fromNavController.pushViewController(viewController, animated: animated)
    }
    
    fileprivate func instantiateViewController(storyboardId: String,
                                               storyboardName:String) -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardId)
    }
}

typealias RoutingSubState = (page:Page, rootState: RootState)
extension AppRouter: StoreSubscriber {
    
    func newState(state: RoutingSubState) {
        
        if (state.rootState.needUpdate) {
            
            switch (state.rootState.rootType) {
                
            case .nav:
                let viewControllers = state
                    .rootState
                    .topPages.map {
                    
                    return self.instantiateViewController(storyboardId: $0.storyboardId,
                                                          storyboardName: $0.storyboardName)
                }
                let navigationController = UINavigationController()
                navigationController.setViewControllers(viewControllers, animated: true)
                window.rootViewController = navigationController
                
            case .tab:
                let viewControllers = state.rootState
                    .topPages
                    .map { p -> UINavigationController in
                    
                    let vc = self.instantiateViewController(storyboardId: p.storyboardId,
                                                            storyboardName: p.storyboardName)
                    return UINavigationController(rootViewController: vc)
                }
                
                let tabBarController = UITabBarController()
                tabBarController.setViewControllers(viewControllers, animated: true)
                window.rootViewController = tabBarController
            }
            
        } else {
            
            
            let page = state.page
            
            var fromNavController:UINavigationController?
            
            switch window.rootViewController {
                
            case let x as UINavigationController:
                fromNavController = x
                
            case let x as UITabBarController:
                
                let activeIndex = x.selectedIndex
                let activeTopViewController = x.viewControllers![activeIndex]
                fromNavController = activeTopViewController as? UINavigationController
                
            default:
                break
            }
            
            if let nav = fromNavController {
                let shouldAnimate = nav.topViewController != nil
                
                pushViewController(storyboardId: page.storyboardId,
                                   storyboardName: page.storyboardName,
                                   animated: shouldAnimate,
                                   fromNavController: nav)
            }
        }
        
    }
}
