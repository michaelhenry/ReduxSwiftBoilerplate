//
//  LoginViewController.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure {
            $0.title = "LOGIN".localized
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        
        mainStore.dispatch(APIActionCreator()
            .login(username: "michael",
                   password: "12345356"))
    }
    
    @IBAction func didTapForgotPassword(_ sender: Any) {
        mainStore.dispatch(RoutingAction(target: .forgotPassword, type: .push))
    }
}

extension LoginViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pageWillDisappear()
    }
}
