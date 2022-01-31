//
//  SignUpViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit
import FirebaseAuth

final class FMSignUpViewController: FMBaseViewController {
    
    //MARK: - Properties
    private var FMApartedView: FMSignUpApartedView { .init(self) }
    private let viewModel: FMSignUpViewModelProtocol
    
    //MARK: - Constructor
    init(viewModel: FMSignUpViewModelProtocol = FMSignUpViewModel()) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - ConfigureLayoutProtocol
    
    override func configureStyle() {
        super.configureStyle()
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Helpers
    
    private func validateButton() {
        let nStatus = FMApartedView.nameTF.getValidationStatus()
        let lStatus = FMApartedView.lastNameTF.getValidationStatus()
        let eStatus = FMApartedView.emailTF.getValidationStatus()
        let pStatus = FMApartedView.passwordTF.getValidationStatus()
        let validations: [Bool] = [nStatus, lStatus, eStatus, pStatus]
        FMApartedView.signUpButton.validateButton(conditions: validations)
    }
    
    private func goToHome() {
        let controller = FMHomeViewController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    private func registerButtonHandle(_ loader: FMPrimaryButtonHideDelagate) {
        let emailTF = FMApartedView.emailTF.getText()
        let passwordTF = FMApartedView.passwordTF.getText()
        
        viewModel.register(email: emailTF, password: passwordTF) { [weak self] in
            loader.hideLoader()
            self?.goToHome()
        }
    }
    
    private func goBackToSignIn() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - FMPrimaryTextFieldDelegate
extension FMSignUpViewController: FMPrimaryTextFieldDelegate {
    func notifyWhenTextFieldWasChanged() { validateButton() }
}

//MARK: - FMPrimaryButtonDelegate
extension FMSignUpViewController: FMPrimaryButtonDelegate {
    func handleButtonTapped(_ loader: FMPrimaryButtonHideDelagate) {
        registerButtonHandle(loader)
    }
}

extension FMSignUpViewController: FMSignUpApartedViewDelegate {
    func tapToDismiss() { goBackToSignIn() }
}
