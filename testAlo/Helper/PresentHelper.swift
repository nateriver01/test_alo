//
//  PresentHelper.swift
//  testAlo
//
//  Created by hamidurrahman on 13/05/19.
//  Copyright © 2019 hamidurrahman. All rights reserved.
//

import UIKit

class PresentHelper{
    
    // General
    static func dismissVC(from vc: UIViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
    
    static func dismissVC(from vc: UIViewController, completion: @escaping () -> Void) {
        vc.dismiss(animated: true, completion: completion)
    }
    
    // Login
    static func showLogin(from vc: UIViewController) {
        // Redirect to Login View
        let storyboard = UIStoryboard(name: "LoginView", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginID")
        vc.present(controller, animated: true, completion: nil)
    }
    
    // Login
    static func showHome(from vc: UIViewController) {
        // Redirect to Login View
        let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
        let homeBar = storyboard.instantiateViewController(withIdentifier: "HomeBar") as? UITabBarController ?? storyboard.instantiateViewController(withIdentifier: "HomeID")
        vc.present(homeBar, animated: true, completion: nil)
    }
    
}
