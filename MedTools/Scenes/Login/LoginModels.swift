//
//  LoginModels.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

enum Login {
    enum Auth {
        struct Request {
            
        }
        
        struct Response {
            var user: User
        }
        
        struct ViewModel {
            var user: User
        }
    }
}
