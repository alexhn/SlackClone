import Cocoa

import Parse

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var config : ParseClientConfiguration? = nil;
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        config = ParseClientConfiguration { (config: ParseMutableClientConfiguration) in
                 config.applicationId = "slackclonealex1"
                 config.server = "http://slackclonealex1.herokuapp.com/parse"
        }
        Parse.initialize(with: config!)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

