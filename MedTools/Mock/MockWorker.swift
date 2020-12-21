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
        let mock = [
            Tool(id: 1, name: "Tourniquet", imageName: "img_tourniquet"),
            Tool(id: 2, name: "Dental Instrument", imageName: "img_dental_instrument"),
            Tool(id: 3, name: "USG (Ultrasonografi)", imageName: "img_usg"),
            Tool(id: 4, name: "Cardiotocography", imageName: "img_cardiotocography"),
            Tool(id: 5, name: "Urine Analyzer", imageName: "img_urine_analyzer"),
            Tool(id: 6, name: "Defibrillator", imageName: "img_defibrillator"),
            Tool(id: 7, name: "Suction Pump", imageName: "img_suction_pump"),
            Tool(id: 8, name: "Hematology Analyzer", imageName: "img_hematology_analyzer"),
            Tool(id: 9, name: "Surgical Lighting", imageName: "img_operation_lamp"),
            Tool(id: 10, name: "X-Ray Unit", imageName: "img_x-ray")
        ]
        
        completion(.success(Dashboard.Response(tools: mock)))
    }
    
    func userAccount() {
        
    }
    
    func authentication(email: String, password: String) {
        
    }
}
