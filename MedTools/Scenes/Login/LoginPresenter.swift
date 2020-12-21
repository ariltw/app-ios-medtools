//
//  LoginPresenter.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

protocol LoginPresentationLogic {
    func presentValidation(completion: Result<Login.Auth.Response, Error>)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
    
    func presentValidation(completion: Result<Login.Auth.Response, Error>) {
        switch completion {
        case .success(let response):
            let data = Login.Auth.ViewModel(user: response.user)
            viewController?.authResult(completion: .success(data))
        case .failure(let error):
            viewController?.authResult(completion: .failure(error))
        }
    }
}
