//
//  AccountRouter.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

import UIKit

protocol AccountRoutingLogic {
    func toLogin(segue: UIStoryboardSegue?)
}

class AccountRouter: NSObject, AccountRoutingLogic {
    
    weak var viewController: AccountVC?
    
    func toLogin(segue: UIStoryboardSegue?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "LoginVC")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(destinationVC)
    }
}
