import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    func moveToCreateAccount() {
        if let createAccountViewController = storyboard?.instantiateController(withIdentifier: "createAccountViewController") as? CreateAccountViewController {
            window?.contentView = createAccountViewController.view
        }
    }

}
