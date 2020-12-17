//
//  MockWorker.swift
//  MedTools
//
//  Created by Ariel on 18/12/20.
//

import Foundation

protocol MockWorkerType {
    func dashboardTools(completion: @escaping (Result<Dashboard.Response, Error>) -> Void)
    func userAccount()
    func authentication(email: String, password: String)
}

class MockWorker: MockWorkerType {
    func dashboardTools(completion: @escaping (Result<Dashboard.Response, Error>) -> Void) {
        
    }
    
    func userAccount() {
        
    }
    
    func authentication(email: String, password: String) {
        
    }
}
