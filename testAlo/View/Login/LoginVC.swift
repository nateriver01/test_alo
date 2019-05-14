//
//  ViewController.swift
//  testAlo
//
//  Created by hamidurrahman on 13/05/19.
//  Copyright © 2019 hamidurrahman. All rights reserved.
//

import UIKit
import Toast_Swift

class LoginVC: UIViewController {
    @IBOutlet weak var tfUsername: VSTextField!
    @IBOutlet weak var tfPassword: VSTextField!
    @IBOutlet weak var btnLogin: CustomButton!
    
    private var username:String?
    private var password:String?
    var loginData:LoginRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initLayout()
    }
    
    private func initLayout(){
        username = tfUsername.text
        password = tfPassword.text
        
    }

    @IBAction func submitLogin(_ sender: Any) {
        username = tfUsername.text
        password = tfPassword.text
        if(testAuthLogin(username: username ?? "", password: password ?? "") == true){
            print(username,password)
            
            
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
            
            PresentHelper.showHome(from: self)
        }
        
    }
    
    private func testAuthLogin(username: String, password: String)->Bool{
        var result:Bool = true
    
        if((username.count<1)&&(password.count<1)){
            
            self.view.makeToast("Harap isi Username dan Password Anda", duration:2.5)
            result = false
        }else if(username.count<1){
            self.view.makeToast("Harap isi Username Anda", duration:2.5)
            result = false
        }else if(password.count<1){
            self.view.makeToast("Harap isi Password Anda", duration:2.5)
            result = false
        }else{
            
            
            result = true
        }
        
        return result
    }
}

