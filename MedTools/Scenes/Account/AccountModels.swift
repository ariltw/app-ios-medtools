//
//  AccountModels.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

import Foundation

enum Account {
    struct Response {
        let user: User
    }
    
    struct ViewModel {
        let name: String
        let email: String
        let password: String
    }
}
