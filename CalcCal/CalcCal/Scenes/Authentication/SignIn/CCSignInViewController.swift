//
//  CCSignInViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 28/01/22.
//

import UIKit

typealias CCSignInViewControllerProtocol = (
    UIViewController & ConfigureLayoutProtocol
)

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

final class CCSignInViewController: CCSignInViewControllerProtocol {
    
    //MARK: - UI Components
    private(set) lazy var UIComponents: CCSignInUIComponents = .init(self)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: - ConfigureLayoutProtocol
    func configureViewHierarchy() {
        view.addSubview(UIComponents.textFieldStackView)
        view?.addSubview(UIComponents.signInButton)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            UIComponents.textFieldStackView
                .leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            UIComponents.textFieldStackView
                .trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            UIComponents.textFieldStackView
                .centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            UIComponents.signInButton.topAnchor.constraint(equalTo: UIComponents.textFieldStackView.bottomAnchor, constant: 30),
            UIComponents.signInButton.leadingAnchor.constraint(equalTo: UIComponents.textFieldStackView.leadingAnchor),
            UIComponents.signInButton.trailingAnchor.constraint(equalTo: UIComponents.textFieldStackView.trailingAnchor),
        ])
    }
    
    func configureStyle() {
        view.backgroundColor = .white
    }
    
}

//MARK: - CCPrimaryButtonDelegate
extension CCSignInViewController: CCPrimaryButtonDelegate {
    func handleButtonTapped() {
        print("Tapped")
    }
}

//MARK: - CCPrimaryTextFieldDelegate
extension CCSignInViewController: CCPrimaryTextFieldDelegate {
    func notifyWhenTextFieldWasChanged() {
        let eValidation = UIComponents.emailTF.getValidationStatus()
        let pValidation = UIComponents.passwordTF.getValidationStatus()
        UIComponents.signInButton.validateButton(conditions: [eValidation, pValidation])
    }
}
