//
//  FMSignInViewModel.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import Foundation

protocol FMSignInViewModelProtocol {
    func accessAccount(email: String, password: String, completion: @escaping () -> Void)
    func getLocalCurrentLogin() -> (email: String, password: String)
    func saveOnLocalCurrentLogin(email: String, password: String)
}

final class FMSignInViewModel: FMSignInViewModelProtocol {
    
    private let service: FMServiceManager = .shared
    
    func accessAccount(
        email: String, password: String, completion: @escaping () -> Void
    ) {
        service.accessAccount(email: email, password: password) { [weak self] completed in
            if completed {
                self?.saveOnLocalCurrentLogin(email: email, password: password)
                completion()
            }
        }
    }
    
    func saveOnLocalCurrentLogin(email: String, password: String) {
        service.saveLocalUSerInformations(email: email, password: password)
    }
    
    func getLocalCurrentLogin() -> (email: String, password: String) {
        return service.getLocalUserInformations()
    }
    
}
