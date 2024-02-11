import UIKit

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnSignup(_ sender: Any) {
        performSegue(withIdentifier: Segue.toSignUpViewController, sender: self)
    }
    
    
    @IBAction func btnShowPassword(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        guard let email = txtEmail.text, !email.isEmpty,
              let password = txtPassword.text, !password.isEmpty else {
            return
        }
        FrenchVerbAPI.signIn(email: email, password: password) { token in
            print("login in with token \(token)")
            Context.loggedUserToken = token
        } failHandler: { httpStatusCode, errorMessage in
            print(errorMessage)
        }
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segue.toHomePageViewController {
            if let username = txtEmail.text, let password = txtPassword.text, !username.isEmpty, !password.isEmpty {
                return true
            }
        }
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Preparing for segue: \(segue.identifier ?? "Unknown segue")")
        if segue.identifier == Segue.toHomePageViewController {
            
        }
    }




    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}


