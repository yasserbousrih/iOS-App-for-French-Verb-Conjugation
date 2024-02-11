//
//  ViewController.swift
//  MidtermFall2023
//
//  Created by Daniel Carvalho on 24/10/23.
//

import UIKit

class ViewController: UIViewController {
   

    @IBOutlet weak var txtUsername : UITextField!
    @IBOutlet weak var txtPassword : UITextField!

    @IBAction func btnLogin(_ sender: Any) {
        
    }
    
    
    
    @IBAction func btnShowPassword(_ sender: Any) {
        txtPassword.isSecureTextEntry = false
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == Segue.toTaskInfoViewController {
            
            if let username = txtUsername.text, let password = txtPassword.text, !username.isEmpty, !password.isEmpty {
                
                return true
            }
        }
            return false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toTaskInfoViewController {
            
            let TaskInfoViewController = segue.destination as! TaskInfoViewController
            
            TaskInfoViewController.loggedUser = txtUsername.text
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
}


