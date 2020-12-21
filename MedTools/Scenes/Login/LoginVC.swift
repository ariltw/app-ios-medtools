//
//  LoginVC.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

import UIKit

protocol LoginDisplayLogic: class {
    func authResult(completion: Result<Login.Auth.ViewModel, Error>)
}

class LoginVC: UIViewController, LoginDisplayLogic {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var interactor: LoginBusinessLogic?
    private var router: (NSObjectProtocol & LoginRoutingLogic)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginOnClick(_ sender: Any) {
        interactor?.requestAuth(
            email: emailTextField.text!,
            password: passwordTextField.text!
        )
    }
    
    func authResult(completion: Result<Login.Auth.ViewModel, Error>) {
        switch completion {
        case .success( _):
            router?.toDashboard(segue: nil)
        case .failure(let error):
            Alert.showErrorDialog(on: self, with: error as! BaseError)
        }
    }
    
}
