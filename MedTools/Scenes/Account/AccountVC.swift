//
//  AccountVC.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

import UIKit

protocol AccountDisplayLogic: class {
    func accountInquiryResult(completion: Result<Account.ViewModel, Error>)
}

class AccountVC: UIViewController, AccountDisplayLogic {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPassword: UILabel!
    
    private let userDefault = UserDefaultStorage()
    private var viewModel: Account.ViewModel!
    private var interactor: AccountBusinessLogic?
    private var router: (NSObjectProtocol & AccountRoutingLogic)?
    
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
        let interactor = AccountInteractor()
        let presenter = AccountPresenter()
        let router = AccountRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.requestInquiry()
    }
    
    private func setupData() {
        userName.text = viewModel.name
        userEmail.text = viewModel.email
        userPassword.text = viewModel.password
    }
    
    @IBAction func logoutOnClick(_ sender: Any) {
        userDefault.removeAuth()
        router?.toLogin(segue: nil)
    }
    
    func accountInquiryResult(completion: Result<Account.ViewModel, Error>) {
        switch completion {
        case .success(let viewModel):
            self.viewModel = viewModel
            setupData()
        case .failure(let error):
            Alert.showErrorDialog(on: self, with: error as! BaseError)
        }
    }
}
