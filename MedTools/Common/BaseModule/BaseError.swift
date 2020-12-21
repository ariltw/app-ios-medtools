//
//  BaseError.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

import Foundation

enum BaseError: String, Error {
    case INVALID_URL = "URL is invalid! Please check your endpoint"
    case INVALID_REQUEST = "Request data is invalid! Please check your request"
    case INVALID_RESPONSE = "Response is invalid! Please check your endpoint response"
    
    case NETWORK_FAILED = "Network Failure! Please check your connection"
        
    case SERVER_UNREACHABLE = "Server is unreachable! Please check your connection"
    case SERVER_SIDE_ERROR = "Server Error! Please check network request"
    
    case NETWORK_ERROR = "Network error! Please check your connection"
    
    case INTERNAL_ERROR = "Sorry, we having some internal trouble!"
    
    case VALIDATION_EMAIL = "Opps! Invalid email address."
    case VALIDATION_PASSWORD_WEAK = "Opps! Your password is weak. Please use a combination of alphanumeric character"
    case VALIDATION_PASSWORD_MIN = "Opps! Your password is too short. Please write min 8 character"
}
