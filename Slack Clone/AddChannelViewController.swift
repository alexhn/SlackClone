//
//  AddChannelViewController.swift
//  Slack Clone
//
//  Created by Aleksandr Nikiforov on 25.05.2020.
//  Copyright © 2020 Aleksandr Nikiforov. All rights reserved.
//

import Cocoa
import Parse

class AddChannelViewController: NSViewController {

    @IBOutlet weak var descriptionTextField: NSTextField!
    @IBOutlet weak var titleTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func addChannelClicked(_ sender: Any) {
        let channel = PFObject(className: "Channel")
        channel["title"] = titleTextField.stringValue
        channel["descrip"] = descriptionTextField.stringValue
        channel.saveInBackground { (success, error: Error?) in
            if success {
                print("Channel created!")
                self.view.window?.close()
            } else {
                print("Error!")
            }
        }
    }
}
