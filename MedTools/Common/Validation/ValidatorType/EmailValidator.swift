//
//  EmailValidator.swift
//  BBADigitalBanking
//
//  Created by Ariel on 03/11/20.
//

import Foundation

struct EmailValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        do {
            /// check mail format
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw BaseError.VALIDATION_EMAIL
            }
        } catch {
            throw BaseError.VALIDATION_EMAIL
        }
        return value
    }
}
