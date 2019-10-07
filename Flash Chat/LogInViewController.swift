//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.text = "a@b.com"
        passwordTextfield.text = "beungeut"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        //TODO: Log in the user
        SVProgressHUD.show()
        loginBtn.setTitle("Loading", for: .normal)
        loginBtn.isEnabled = false
        
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (AuthDataResult, Error) in
            if Error != nil {
                print("error",Error!)
                
            }else{
                print("success to login")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
            }
            self.loginBtn.setTitle("Log in", for: .normal)
            self.loginBtn.isEnabled = true
        }
 
    }
    


    
}  
