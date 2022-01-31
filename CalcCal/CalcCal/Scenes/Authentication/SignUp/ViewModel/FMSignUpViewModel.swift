//
//  FMSignUpViewModel.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import Foundation

protocol FMSignUpViewModelProtocol {
    func register(email: String, password: String, completion: @escaping () -> Void)
}

final class FMSignUpViewModel: FMSignUpViewModelProtocol {
    
    private let service: FMServiceManager = .shared
    
    func register(email: String, password: String, completion: @escaping () -> Void) {
        service.registerAccount(email: email, password: password) { completed in
            if completed {
                completion()
                return
            }
            //TODO: Pop up error
        }
    }
    
}
