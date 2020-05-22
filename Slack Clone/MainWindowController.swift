import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    func moveToCreateAccount() {
        print("MOVE!")
        if let createAccountViewController = storyboard?.instantiateController(withIdentifier: "createAccountViewController") as? CreateAccountViewController {
            print("SET!")
            window?.contentView = createAccountViewController.view
        }
    }

}
