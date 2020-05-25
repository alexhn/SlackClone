import Cocoa

import Parse

class MainWindowController: NSWindowController {

    var loginVC: LoginViewController?
    
    var createAccountVC: CreateAccountViewController?
    
    override func windowDidLoad() {
        super.windowDidLoad()
        loginVC = contentViewController as? LoginViewController
    }
    
    func moveToCreateAccount() {
        if createAccountVC == nil {
            createAccountVC = storyboard?.instantiateController(withIdentifier: "createAccountViewController") as? CreateAccountViewController
        }
        window?.contentView = createAccountVC?.view
    }
    
    func moveToLogin() {
        window?.contentView = loginVC?.view
    }

}
