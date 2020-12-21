//
//  ValidatorFactory.swift
//  BBADigitalBanking
//
//  Created by Ariel on 14/09/20.
//

enum ValidatorType {
    case email
    case password
}

enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator()
        case .password: return PasswordValidator()
        }
    }
}
