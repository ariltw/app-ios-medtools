//
//  LoginInteractor.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

import Foundation

protocol LoginBusinessLogic {
    func requestAuth(email: String, password: String)
}

class LoginInteractor: LoginBusinessLogic {
    
    var presenter: LoginPresentationLogic?
    var worker = MockWorker()
    var userDefaultStorage = UserDefaultStorage()
    
    func requestAuth(email: String, password: String) {
        do {
            _ = try email.validatedText(validationType: ValidatorType.email)
            _ = try password.validatedText(validationType: ValidatorType.password)
        } catch (let error) {
            presenter?.presentValidation(completion: .failure(error))
            return
        }
        
        
        worker.authentication(email: email, password: password) { [self] (result) in
            switch result {
            case .success(let response):
                userDefaultStorage.saveAuth(email: email, password: password)
                presenter?.presentValidation(completion: .success(response))
            case .failure(let error):
                presenter?.presentValidation(completion: .failure(error))
            }
        }
    }
}
