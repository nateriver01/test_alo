//
//  ProfileVC.swift
//  testAlo
//
//  Created by hamidurrahman on 14/05/19.
//  Copyright © 2019 hamidurrahman. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var ivProfilePicture: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
        // Do any additional setup after loading the view.
    }
    
    private func initLayout(){
        ivProfilePicture.setImageFromUrl(url:URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Zac_Efron_2%2C_2012.jpg/220px-Zac_Efron_2%2C_2012.jpg")! )
        labelName.text = UserDefaults.standard.string(forKey: "username") ?? ""
        labelGender.text = "Pria"
        labelPhone.text = "0888"
        
    }
    
    
    @IBAction func btnLogout(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        PresentHelper.showLogin(from: self)
        
    }
    
}
