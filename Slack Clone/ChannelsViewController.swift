//
//  ChannelsViewController.swift
//  Slack Clone
//
//  Created by Aleksandr Nikiforov on 25.05.2020.
//  Copyright © 2020 Aleksandr Nikiforov. All rights reserved.
//

import Cocoa
import Parse

class ChannelsViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var profilePicImageView: NSImageView!
    
    var addChannelWindowController : NSWindowController?
    
    @IBOutlet weak var channelsTableView: NSTableView!
    
    var channels : [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        channelsTableView.dataSource = self
        channelsTableView.delegate = self
    }
    
    override func viewDidAppear() {
        getChannels()
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
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let channel = channels[row]
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "channelCell"), owner: nil) as? NSTableCellView {
            if let title = channel["title"] as? String {
                cell.textField?.stringValue = "#\(title)"
            }
            return cell
        }
        return nil
    }
    
    func getChannels() {
        let query = PFQuery(className: "Channel")
        query.order(byAscending: "title")
        query.findObjectsInBackground { (channels: [PFObject]?, error: Error?) in
            if channels != nil {
                self.channels = channels!
                self.channelsTableView.reloadData()
            }
        }
    }
}
