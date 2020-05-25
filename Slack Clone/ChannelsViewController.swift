//
//  ChannelsViewController.swift
//  Slack Clone
//
//  Created by Aleksandr Nikiforov on 25.05.2020.
//  Copyright © 2020 Aleksandr Nikiforov. All rights reserved.
//

import Cocoa
import Parse

class ChannelsViewController: NSViewController {

    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var profilePicImageView: NSImageView!
    
    var addChannelWindowController : NSWindowController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        if let user = PFUser.current() {
           if let name = user["name"] as? String {
               nameLabel.stringValue = name
           }
            if let imageFile = user["profilePic"] as? PFFileObject {
                imageFile.getDataInBackground { (data: Data?, error: Error?) in
                    if error == nil {
                        if data != nil {
                            let image = NSImage(data: data!)
                            self.profilePicImageView.image = image
                        }
                    } else {
                        print("Problem downloading user image.")
                    }
                }
            }
        }
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        PFUser.logOut()
        if let mainWindowController = view.window?.windowController as? MainWindowController {
           mainWindowController.moveToLogin()
        }
    }
    
    @IBAction func addChannelClicked(_ sender: Any) {
        addChannelWindowController = storyboard?.instantiateController(withIdentifier: "addChannelWindowController") as? NSWindowController
        addChannelWindowController?.showWindow(nil)
    }
    
}
