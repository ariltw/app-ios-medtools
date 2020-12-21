//
//  DashboardPresenter.swift
//  MedTools
//
//  Created by Ariel on 18/12/20.
//

protocol DashboardPresentationLogic {
    func presentTools(completion: Result<Dashboard.Response, Error>)
}

class DashboardPresenter: DashboardPresentationLogic {
    
    weak var viewController: DashboardDisplayLogic?
    
    func presentTools(completion: Result<Dashboard.Response, Error>) {
        switch completion {
        case .success(let response):
            let data = Dashboard.ViewModel(tools: response.tools)
            viewController?.tooslResult(completion: .success(data))
        case .failure(let error):
            viewController?.tooslResult(completion: .failure(error))
        }
    }
}
