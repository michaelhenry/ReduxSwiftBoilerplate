//
//  SettingsViewController.swift
//  ReduxSwiftBoilerplate
//
//  Created by Michael Henry Pantaleon on 2017/10/24.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure {
            $0.title = "SETTINGS".localized
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Logout",
                            style: .plain,
                            target: self,
                            action: #selector(didTapLogout(sender:)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didTapLogout(sender:UIBarButtonItem) {
        
        mainStore.dispatch(APIActionCreator().logout())
    }
}

extension SettingsViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pageWillDisappear()
    }
}
