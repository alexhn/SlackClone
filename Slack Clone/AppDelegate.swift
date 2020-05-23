import Cocoa

import Parse

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let configuration = ParseClientConfiguration { (config: ParseMutableClientConfiguration) in
            config.applicationId = "slackclonealex1"
            config.server = "http://slackclonealex1.herokuapp.com/parse"
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

