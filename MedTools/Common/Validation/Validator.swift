//
//  Validator.swift
//  BBADigitalBanking
//
//  Created by Ariel on 26/08/20.
//

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
    func validated(_ value: Int) throws -> Int
}

extension ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        return value
    }
    
    func validated(_ value: Int) throws -> Int {
        return value
    }
}
