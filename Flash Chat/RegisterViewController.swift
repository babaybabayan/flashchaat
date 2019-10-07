//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    
    //Pre-linked IBOutlets
    
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setButtonLoading(_ title: String, enable: Bool){
        registerBtn.setTitle(title, for: .normal)
        registerBtn.isEnabled = enable
    }
    
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        
        
        //TODO: Set up a new user on our Firbase database
        SVProgressHUD.show()
        setButtonLoading("loading", enable: false)
        
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (User, error) in
            if error != nil {
                print("Error",error!)
            } else {
                SVProgressHUD.dismiss()
                print("Registration Successfully")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
            self.setButtonLoading("Register", enable: true)
        }
        
        
        
    } 
    
    
}
