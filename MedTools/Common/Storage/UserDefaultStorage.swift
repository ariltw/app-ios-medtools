//
//  UserDefault.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

import Foundation

class UserDefaultStorage {
    
    let storage = UserDefaults.standard
    
    enum Key: String {
        case email
        case password
    }
    
    /// Save User Authentication Data
    /// - Parameters:
    ///   - email: User mail
    ///   - password: User password
    func saveAuth(email: String, password: String) {
        storage.set(email, forKey: Key.email.rawValue)
        storage.set(password, forKey: Key.password.rawValue)
        storage.synchronize()
    }
    
    /// Read User Authentication Data
    /// - Returns: User data
    func readAuth() -> (email: String, password: String) {
        return (
            storage.object(forKey: Key.email.rawValue) as! String,
            storage.object(forKey: Key.password.rawValue) as! String
        )
    }
    
    /// Remove User Data to logged out the User
    func removeAuth() {
        storage.removeObject(forKey: Key.email.rawValue)
        storage.removeObject(forKey: Key.password.rawValue)
    }
    
    func checkAuth() -> Bool {
        if storage.string(forKey: Key.email.rawValue) != nil {
            return true
        } else {
            return false
        }
    }
}
