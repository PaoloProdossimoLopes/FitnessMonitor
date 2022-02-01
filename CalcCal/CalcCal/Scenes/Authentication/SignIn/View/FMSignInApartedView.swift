//
//  FMSignInUIComponents.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

typealias FMSignInApartedViewProtocol = (FMApartedBaseView)

protocol FMSignInApartedViewDelegate: AnyObject {
    func dontHaveAccountButtonHandleTapped()
}

final class FMSignInApartedView: FMSignInApartedViewProtocol {
    
    //MARK: - Properties
    
    typealias RequeiredDelegates = (
        FMSignInViewController & FMPrimaryButtonDelegate &
        FMPrimaryTextFieldDelegate & FMSignInApartedViewDelegate
    )
    
    private let controllerDelegate: RequeiredDelegates
    
    //MARK: - UI Components
    
    lazy var iconImageView: UIImageView = {
        let image = UIImage(named: "fitness.monitor.icon.default")
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var emailTF: FMPrimaryTextField = .init(
        controllerDelegate, image: "envelope", placeholder: "Email ...",
        validation: FMValidators.validateAsEmail
    )
    
    lazy var passwordTF: FMPrimaryTextField = .init(
        controllerDelegate, image: "lock", placeholder: "Password ...",
        isSecure: true, validation: FMValidators.validateAsWeakestPasswordForce
    )
    
    lazy var textFieldStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTF, passwordTF, forgotPasswordBbutton])
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var forgotPasswordBbutton: UIButton = {
        let button = UIButton()
        let buttonTitle: String  = "Esqueceu a senha?"
        button.setTitleColor(.red, for: .normal)
        button.setTitle(buttonTitle, for: .normal)
        button.setAttributedTitle(buttonTitle.underLined, for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        button.isEnabled = true
        //button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        return button
    }()
    
    lazy var signInButton: FMPrimaryButton = .init(controllerDelegate, btnTitle: "Logar", hasLoader: true)
    
    lazy var registerLabel: FMMultipleTextStyleLabel = {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(doubleStringTextLabelHandleTapped)
        )
        let button = FMMultipleTextStyleLabel(
            texts: [("Ainda nao possui uma conta? ", [
                        .font: UIFont.systemFont(ofSize: 17),
                        .foregroundColor: UIColor.black]),
                    ("Registre-se", [
                        .font: UIFont.boldSystemFont(ofSize: 17),
                        .foregroundColor: UIColor.red])]
        )
        button.addGestureRecognizer(tap)
        return button
    }()
    
    //MARK: - Constructor
    
    init(_ delegate: RequeiredDelegates) {
        self.controllerDelegate = delegate
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ConfigureLayoutProtocol
    
    override func configureViewHierarchy() {
        super.configureViewHierarchy()
        addSubview(iconImageView)
        addSubview(textFieldStackView)
        addSubview(signInButton)
        addSubview(registerLabel)
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 175),
            iconImageView.heightAnchor.constraint(equalToConstant: 175),
            iconImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                               constant: 40),
            iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            textFieldStackView
                .leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            textFieldStackView
                .trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            textFieldStackView
                .centerYAnchor.constraint(equalTo: centerYAnchor),
            
            signInButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 30),
            signInButton.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor),
            
            registerLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            registerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            registerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    //MARK: - Selectors
    
    @objc private func doubleStringTextLabelHandleTapped() {
        controllerDelegate.dontHaveAccountButtonHandleTapped()
    }
    
}
