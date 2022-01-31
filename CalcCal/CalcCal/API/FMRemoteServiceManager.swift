//
//  FMRemoteServiceManager.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import FirebaseAuth

protocol FMRemoteServiceManagerProtocol {
    func signIn(email: String, password: String,
                completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func register(email: String, password: String,
                completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func logOut(_ completion: (Bool) -> Void)
}

final class FMRemoteServiceManager: FMRemoteServiceManagerProtocol {
    
    private let auth = FMFirebaseAPIAccessShotcuts.shared.authShared
    
    func signIn(
        email: String, password: String,
        completion: @escaping (Result<AuthDataResult, Error>) -> Void
    ) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error { completion(.failure(error)) }
            if let auth = result { completion(.success(auth)) }
        }
    }
    
    func register(
        email: String, password: String,
        completion:@escaping (Result<AuthDataResult, Error>) -> Void
    ) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let auth = result {
                completion(.success(auth))
                return
            }
        }
    }
    
    func logOut(_ completion: (Bool) -> Void = { _ in }) {
        do {
            try auth.signOut()
            completion(true)
        } catch {
            completion(false)
        }
    }

}

