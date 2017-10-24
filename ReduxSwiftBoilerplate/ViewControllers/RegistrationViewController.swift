//
//  RegistrationViewController.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure {
            $0.title = "REGISTRATION".localized
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapRegister(_ sender: Any) {
        
        mainStore.dispatch(APIActionCreator().register(
            username: "michael123",
            email: "me@iamkel.net",
            password: "12345678"))
    }
    
    @IBAction func didTapAlreadyHaveAnAccount(_ sender: Any) {
         mainStore.dispatch(RoutingAction(target: .login, type: .push))
    }
  
}

extension RegistrationViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pageWillDisappear()
    }
}
