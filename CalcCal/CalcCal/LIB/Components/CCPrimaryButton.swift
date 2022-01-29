//
//  CCPrimaryButton.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

typealias CCPrimaryButtonProtocol = (UIButton & ConfigureLayoutProtocol)

protocol CCPrimaryButtonDelegate: AnyObject {
    func handleButtonTapped()
}

final class CCPrimaryButton: CCPrimaryButtonProtocol {
    
    //MARK: - Properties
    
    private let primaryDelegate: CCPrimaryButtonDelegate
    let buttonTitle: String
    let isAnimate: Bool
    
    //MARK: - Constructor
    
    init(
        _ delegate: CCPrimaryButtonDelegate,
        btnTitle: String, isAnimate: Bool = true
    ) {
        self.primaryDelegate = delegate
        self.buttonTitle = btnTitle
        self.isAnimate = isAnimate
        super.init(frame: .zero)
        commonInit()
        addTarget(self, action: #selector(primaryButtonWasTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ConfigureLayoutProtocol
    
    func configureViewHierarchy() { /*Is not nescessary*/ }
    
    func configureConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func configureStyle() {
        setTitle(buttonTitle, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        layer.cornerRadius = 5
        animationManager(false)
    }
    
    //MARK: - Helpers
    
    private func animationManager(_ isValid: Bool) {
        if isAnimate {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.configureButtonState(isValid)
            }
        } else {
            configureButtonState(isValid)
        }
    }
    
    private func configureButtonState(_ isValid: Bool) {
        setTitleColor(isValid ? .white : .darkGray, for: .normal)
        backgroundColor = isValid ? .red : .lightGray.withAlphaComponent(0.4)
        isEnabled = isValid
    }
    
    //MARK: - Setters
    
    func validateButton(conditions: [Bool]) {
        if conditions.contains(false) { animationManager(false) }
        else { animationManager(true) }
    }
    
    //MARK: - Selectors
    
    @objc private func primaryButtonWasTapped() {
        primaryDelegate.handleButtonTapped()
    }
    
}
