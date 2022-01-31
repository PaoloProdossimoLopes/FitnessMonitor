//
//  FMSignInViewModel.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import Foundation

protocol FMSignInViewModelProtocol {
    func accessAccount(email: String, password: String, completion: @escaping () -> Void)
}

final class FMSignInViewModel: FMSignInViewModelProtocol {
    
    private let service: FMServiceManager = .shared
    
    func accessAccount(
        email: String, password: String, completion: @escaping () -> Void
    ) {
        service.accessAccount(email: email, password: password) { completed in
            if completed { completion() }
        }
    }
    
}
