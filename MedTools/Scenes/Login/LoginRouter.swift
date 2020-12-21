//
//  LoginRouter.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

import UIKit

protocol LoginRoutingLogic {
    func toDashboard(segue: UIStoryboardSegue?)
}

class LoginRouter: NSObject, LoginRoutingLogic {
    
    weak var viewController: LoginVC?
    
    func toDashboard(segue: UIStoryboardSegue?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(destinationVC)
    }
    
}
