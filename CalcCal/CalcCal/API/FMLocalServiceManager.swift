//
//  FMLocalServiceManager.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import Foundation

protocol FMLocalServiceManagerProtocol {
    func saveOnLocalDataBase(email: String, password: String)
    func getOnLocalDataBase() -> (email: String, password: String)
}

final class FMLocalServiceManager: FMLocalServiceManagerProtocol {
    
    func saveOnLocalDataBase(email: String, password: String) {
        saveEmailLocal(email: email)
        savePasswordLocal(password: password)
    }
    
    func getOnLocalDataBase() -> (email: String, password: String) {
        let email = getEmailLocal()
        let password = getPasswordLocal()
        return (email, password)
    }
    
    private func saveEmailLocal(email: String) {
        UserDefaults.standard.setValue(email, forKey: "EMAIL")
    }
    
    private func savePasswordLocal(password: String) {
        UserDefaults.standard.setValue(password, forKey: "PASSWORD")
    }
    
    private func getEmailLocal() -> String {
        let email = UserDefaults.standard.string(forKey: "EMAIL")
        return email ?? ""
    }
    
    private func getPasswordLocal() -> String {
        let password = UserDefaults.standard.string(forKey: "PASSWORD")
        return password ?? ""
    }
    
}
