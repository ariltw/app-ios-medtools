//
//  DashboardInteractor.swift
//  MedTools
//
//  Created by Ariel on 18/12/20.
//

protocol DashboardBusinessLogic {
    func requestTools()
}

protocol DashboardDataStore {
    // empty data store
}

class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore {
    
    var presenter: DashboardPresentationLogic?
    var worker = MockWorker()
    
    func requestTools() {
        worker.dashboardTools { [self] (result) in
            switch result {
            case .success(let response):
                presenter?.presentTools(completion: .success(response))
            case .failure(let error):
                presenter?.presentTools(completion: .failure(error))
            }
        }
    }
}
