//
//  SignUpViewController.swift
//  MidtermFall2023
//
//  Created by Daniel Carvalho on 25/10/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtUsername : UITextField!
    @IBOutlet weak var txtPassword : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnSignUpTouchUpInside( _ sender : Any? ){
        
        // validation
        
        // check if the user exists
        
        let newUser = User(username: txtUsername.text!.lowercased(), password: txtPassword.text!)
        
        UserProvider.allUsers.append(newUser)
        
        
    }
    
    @IBAction func btnShowPasswordTapped( _ sender : Any? ){
        
        txtPassword.isSecureTextEntry.toggle()
        
    }


}
