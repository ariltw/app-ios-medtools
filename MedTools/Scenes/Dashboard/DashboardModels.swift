//
//  DashboardModels.swift
//  MedTools
//
//  Created by Ariel on 18/12/20.
//

enum Dashboard {
    
    struct Request {
        // empty request
    }
    
    struct Response {
        var tools: [Tool]
    }
    
    struct ViewModel {
        var tools: [Tool]
    }
}
