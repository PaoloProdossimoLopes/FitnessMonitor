//
//  FMSignInViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 28/01/22.
//

import UIKit
import FirebaseAuth

typealias FMSignInViewControllerProtocol = (FMBaseViewController)

final class FMSignInViewController: FMSignInViewControllerProtocol {
    
    //MARK: - Properties
    private(set) lazy var FMApartedView: FMSignInApartedView = .init(self)
    private let viewModel: FMSignInViewModelProtocol
    
    //MARK: - Constructor
    
    init(viewModel: FMSignInViewModelProtocol = FMSignInViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = FMApartedView
    }
    
    //MARK: - Helpers
    
    private func goToHome() {
        let controller = FMHomeViewController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    private func loginButtonHandleTapped(_ loader: FMPrimaryButtonHideDelagate) {
        let emailTF = FMApartedView.emailTF.getText()
        let passwordTF = FMApartedView.passwordTF.getText()
        
        viewModel.accessAccount(email: emailTF, password: passwordTF) { [weak self] in
            loader.hideLoader()
            self?.goToHome()
        }
    }
    
    private func validateButton() {
        let eValidation = FMApartedView.emailTF.getValidationStatus()
        let pValidation = FMApartedView.passwordTF.getValidationStatus()
        FMApartedView.signInButton.validateButton(conditions: [eValidation, pValidation])
    }
    
    private func goToSignUp() {
        let controller = FMSignUpViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - FMPrimaryButtonDelegate
extension FMSignInViewController: FMPrimaryButtonDelegate {
    func handleButtonTapped(_ loader: FMPrimaryButtonHideDelagate) {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.loginButtonHandleTapped(loader)
        }
    }
}

//MARK: - FMPrimaryTextFieldDelegate
extension FMSignInViewController: FMPrimaryTextFieldDelegate {
    func notifyWhenTextFieldWasChanged() { validateButton() }
}

//MARK: - FMSignInApartedViewDelegate
extension FMSignInViewController: FMSignInApartedViewDelegate {
    func dontHaveAccountButtonHandleTapped() { goToSignUp() }
}
