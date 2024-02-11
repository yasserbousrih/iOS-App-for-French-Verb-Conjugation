import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginbutton(_ sender: Any) {
        performSegue(withIdentifier: Segue.tologinViewControllers, sender: self)
    }
    
    @IBAction func btnSignUpTouchUpInside(_ sender: Any?) {
        guard let email = txtEmail.text, !email.isEmpty,
                  let name = txtName.text, !name.isEmpty,
                  let password = txtPassword.text, !password.isEmpty,
                  let repeatPassword = txtRepeatPassword.text, !repeatPassword.isEmpty,
                  password == repeatPassword
            else {
                return
            }


            FrenchVerbAPI.signUp(email: email, name: name, password: password) { token in
                Context.loggedUserToken = token


                self.performSegue(withIdentifier: Segue.tologinViewControllers, sender: self)
            } failHandler: { httpStatusCode, errorMessage in
                print("Signup failed with HTTP code \(httpStatusCode) - \(errorMessage)")
            }
        
    }
}
