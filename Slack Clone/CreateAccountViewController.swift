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
    
    var profilePicFile : PFFileObject?
  
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
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = true
        openPanel.canChooseFiles = true
        openPanel.begin { (result) in
            if result.rawValue == NSFileHandlingPanelOKButton {
                if let imageUrl = openPanel.urls.first {
                    if let image = NSImage(contentsOf: imageUrl) {
                        self.profilePicImageView.image = image
                        let imageData = self.jpegDataFrom(image: image)
                        self.profilePicFile = PFFileObject(data: imageData)
                        self.profilePicFile?.saveInBackground()
                    }
                }
            }
        }
    }
    
    @IBAction func createAccountClicked(_ sender: Any) {
        let user = PFUser()
        user.email = emailTextField.stringValue
        user.password = passwordTextField.stringValue
        user.username = emailTextField.stringValue
        user["name"] = nameTextField.stringValue
        user["profilePic"] = self.profilePicFile
        user.signUpInBackground { (success : Bool, error: Error?) in
            if success {
                print("Made a User!")
            } else {
                print("Error!")
            }
        }
    }
    
    func jpegDataFrom(image:NSImage) -> Data {
        let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)!
        let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
        let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!
        return jpegData
    }
    
}
