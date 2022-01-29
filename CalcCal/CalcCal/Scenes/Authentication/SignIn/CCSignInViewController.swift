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
