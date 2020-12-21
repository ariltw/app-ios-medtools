//
//  AccountInteractor.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

protocol AccountBusinessLogic {
    func requestInquiry()
}

class AccountInteractor: AccountBusinessLogic {
    
    var presenter: AccountPresentationLogic?
    var userDefault = UserDefaultStorage()
    
    func requestInquiry() {
        let data = userDefault.readAuth()
        let user = User(email: data.email, password: data.password)
        let response = Account.Response(user: user)
        presenter?.presentAccount(completion: .success(response))
    }
}
