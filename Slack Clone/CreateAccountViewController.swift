//
//  CreateAccountViewController.swift
//  Slack Clone
//
//  Created by Aleksandr Nikiforov on 23.05.2020.
//  Copyright © 2020 Aleksandr Nikiforov. All rights reserved.
//

import Cocoa

class CreateAccountViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        if let mainWindowController = view.window?.windowController as? MainWindowController {
            mainWindowController.moveToLogin()
        }
    }
}
