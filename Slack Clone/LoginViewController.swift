//
//  LoginViewController.swift
//  Slack Clone
//
//  Created by Aleksandr Nikiforov on 23.05.2020.
//  Copyright © 2020 Aleksandr Nikiforov. All rights reserved.
//

import Cocoa

import Parse

class LoginViewController: NSViewController {

    @IBOutlet weak var emailTextField: NSTextField!
    
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailTextField.stringValue, password: passwordTextField.stringValue) { (user: PFUser?, error: Error?) in
            if error == nil {
                if let mainWindowController = self.view.window?.windowController as? MainWindowController {
                    mainWindowController.moveToChat()
                }
            } else {
                print("There's a problem, couldn't log in")
            }
        }
    }
    
    @IBAction func createAccountClicked(_ sender: Any) {
        if let mainWindowController = view.window?.windowController as? MainWindowController {
            mainWindowController.moveToCreateAccount()
        }
    }
}
