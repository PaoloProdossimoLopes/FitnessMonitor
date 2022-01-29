//
//  CCSignInUIComponents.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

struct CCSignInUIComponents {
    
    typealias RequeiredDelegates = (
        CCSignInViewController & CCPrimaryButtonDelegate & CCPrimaryTextFieldDelegate
    )
    
    private let deleg: RequeiredDelegates
    
    init(_ delegate: RequeiredDelegates) {  self.deleg = delegate }
    
    lazy var emailTF: CCPrimaryTextField = .init(
        deleg, image: "envelope", placeholder: "Email ...",
        validation: CCValidators.validateAsEmail
    )
    
    lazy var passwordTF: CCPrimaryTextField = .init(
        deleg, image: "lock", placeholder: "Password ...",
        isSecure: true, validation: CCValidators.validateAsWeakestPasswordForce
    )
    
    lazy var textFieldStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTF, passwordTF])
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var signInButton: CCPrimaryButton = .init(deleg, btnTitle: "Logar")
    
}
