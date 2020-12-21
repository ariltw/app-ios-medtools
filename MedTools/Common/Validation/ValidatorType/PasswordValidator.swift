//
//  PhoneValidator.swift
//  BBADigitalBanking
//
//  Created by Ariel on 03/11/20.
//

import Foundation

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        
        if value.count < 8 {
            throw BaseError.VALIDATION_PASSWORD_MIN
        }
        
        if value.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil && value == "" {
            throw BaseError.VALIDATION_PASSWORD_WEAK
        }
        
        return value
    }
}
