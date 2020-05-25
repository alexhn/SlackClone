//
//  CreateAccountViewController.swift
//  Slack Clone
//
//  Created by Aleksandr Nikiforov on 23.05.2020.
//  Copyright © 2020 Aleksandr Nikiforov. All rights reserved.
//

import Cocoa
import Parse

class CreateAccountViewController: NSViewController {

    @IBOutlet weak var passwordTextField: NSSecureTextField!
    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var nameTextField: NSTextField!
    
    @IBOutlet weak var profilePicImageView: NSImageView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(config)
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        if let mainWindowController = view.window?.windowController as? MainWindowController {
            mainWindowController.moveToLogin()
        }
    }
    
    @IBAction func chooseImageClicked(_ sender: Any) {
        
    }
    
    @IBAction func createAccountClicked(_ sender: Any) {
        let user = PFUser()
        user.email = emailTextField.stringValue
        user.password = passwordTextField.stringValue
        user.username = emailTextField.stringValue
        user["name"] = nameTextField.stringValue
        user.signUpInBackground { (success : Bool, error: Error?) in
            if success {
                print("Made a User!")
            } else {
                print("Error!")
            }
        }
    }
    
}
