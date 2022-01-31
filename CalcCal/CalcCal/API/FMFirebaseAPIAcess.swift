//
//  FMFirebaseAPIAcess.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import FirebaseAuth

struct FMFirebaseAPIAccessShotcuts {
    
    //MARK: - Singleton
    static let shared: FMFirebaseAPIAccessShotcuts = .init()
    private init() {}
    
    //MARK: - keys
    let authShared = FirebaseAuth.Auth.auth()
}
