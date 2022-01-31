//
//  FMServiceManager.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import Foundation

protocol FMServiceManagerProtocol {
    func registerAccount(email: String, password: String,
                         completion: @escaping (Bool) -> Void)
}

final class FMServiceManager: FMServiceManagerProtocol {
    
    //MARK: - Properties
    private let remoteManager: FMRemoteServiceManagerProtocol
    private let localManager: FMLocalServiceManagerProtocol
    
    static let shared: FMServiceManager = .init()
    
    //MARK: - Constructor
    private init(
        remote: FMRemoteServiceManagerProtocol = FMRemoteServiceManager(),
        local: FMLocalServiceManagerProtocol = FMLocalServiceManager()
    ) {
        self.localManager = local
        self.remoteManager = remote
    }
    
    //MARK: - Methods
    
    func registerAccount(
        email: String, password: String,
        completion: @escaping (Bool) -> Void
    ) {
        remoteManager.register(email: email, password: password) { _ in
            completion(true)
        }
    }
    
    func accessAccount(
        email: String, password: String,
        completion: @escaping (Bool) -> Void
    ) {
        remoteManager.signIn(email: email, password: password) { _ in
            completion(true)
        }
    }
    
}
