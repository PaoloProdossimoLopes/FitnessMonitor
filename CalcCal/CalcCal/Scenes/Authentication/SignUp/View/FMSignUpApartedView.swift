//
//  FMSignUpApartedView.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import UIKit

protocol FMSignUpApartedViewDelegate: AnyObject {
    func tapToDismiss()
}

final class FMSignUpApartedView: FMApartedBaseView {
    
    //MARK: - Propertie
    typealias RequiredFMSignUpApartedViewDelegate = (
        FMPrimaryButtonDelegate & FMPrimaryTextFieldDelegate & FMSignUpApartedViewDelegate
    )
    private let controllerDelegate: RequiredFMSignUpApartedViewDelegate
    
    //MARK: - UI Components
    
    lazy var iconImageView: UIImageView = {
        let image = UIImage(named: "fitness.monitor.icon.default")
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var nameTF = FMPrimaryTextField(controllerDelegate, image: "person", placeholder: "Nome")
    lazy var lastNameTF = FMPrimaryTextField(controllerDelegate, image: "", placeholder: "Sobrenome", textAlignment: .left)
    lazy var HNameStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameTF, lastNameTF])
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.spacing = 20
        return stack
    }()
    
    lazy var emailTF: FMPrimaryTextField = .init(
        controllerDelegate, image: "envelope", placeholder: "Email ...",
        validation: FMValidators.validateAsEmail
    )
    lazy var passwordTF: FMPrimaryTextField = .init(
        controllerDelegate, image: "lock", placeholder: "Password ...",
        isSecure: true, validation: FMValidators.validateAsWeakestPasswordForce
    )
    
    lazy var VFieldsStackView: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [HNameStack, emailTF, passwordTF, signUpButton]
        )
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var signUpButton: FMPrimaryButton = .init(controllerDelegate, btnTitle: "Criar conta")
    
    lazy var loginLabel = FMMultipleTextStyleLabel(
        texts: [
            ("Já possui uma conta? faça o ", [
                .font: UIFont.systemFont(ofSize: 17),
                .foregroundColor: UIColor.black
            ]),
            ("Login", [
                .font: UIFont.boldSystemFont(ofSize: 17),
                .foregroundColor: UIColor.red
            ])
        ]
    )
    
    //MARK: - Constructor
    init(_ delegate: RequiredFMSignUpApartedViewDelegate) {
        self.controllerDelegate = delegate
        super.init(frame: .zero)
        commonInit()
        configureActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - FMConfigureLayoutProtocol
    
    override func configureViewHierarchy() {
        super.configureViewHierarchy()
        addSubview(iconImageView)
        addSubview(loginLabel)
        addSubview(VFieldsStackView)
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 175),
            iconImageView.heightAnchor.constraint(equalToConstant: 175),
            iconImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                               constant: 40),
            iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            VFieldsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            VFieldsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            VFieldsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            loginLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    //MARK: - Helpers
    
    private func configureActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(loginLabelHandleTapped))
        loginLabel.addGestureRecognizer(tap)
    }
    
    //MARK: - Selectors
    
    @objc private func loginLabelHandleTapped() {
        controllerDelegate.tapToDismiss()
    }
}


