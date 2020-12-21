//
//  AccountPresenter.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

protocol AccountPresentationLogic {
    func presentAccount(completion: Result<Account.Response, Error>)
}

class AccountPresenter: AccountPresentationLogic {
    
    weak var viewController: AccountDisplayLogic?
    
    func presentAccount(completion: Result<Account.Response, Error>) {
        switch completion {
        case .success(let response):
            let password = response.user.password
            let maskedPass = String(password.enumerated().map { (index, element) -> Character in
                return index < password.count ? "x" : element
            })
            
            let data = Account.ViewModel(
                name: "Doctor",
                email: response.user.email,
                password: maskedPass)
            viewController?.accountInquiryResult(completion: .success(data))
        case .failure(let error):
            viewController?.accountInquiryResult(completion: .failure(error))
        }
    }
}
