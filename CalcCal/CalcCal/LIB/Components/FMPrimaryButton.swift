//
//  FMPrimaryButton.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

typealias FMPrimaryButtonProtocol = (
    UIButton & FMConfigureLayoutProtocol
)

protocol FMPrimaryButtonHideDelagate: AnyObject {
    func hideLoader()
}

protocol FMPrimaryButtonDelegate: AnyObject {
    func handleButtonTapped(_ loader: FMPrimaryButtonHideDelagate)
}

final class FMPrimaryButton: FMPrimaryButtonProtocol {
    
    //MARK: - Properties
    
    private let primaryDelegate: FMPrimaryButtonDelegate
    
    let buttonTitle: String
    let isAnimate: Bool
    let hasLoader: Bool
    
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(
            colors: [.white],
            lineWidth: 5
        )
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    //MARK: - Constructor
    
    init(
        _ delegate: FMPrimaryButtonDelegate,
        btnTitle: String, isAnimate: Bool = true, hasLoader: Bool = false
    ) {
        self.primaryDelegate = delegate
        self.buttonTitle = btnTitle
        self.isAnimate = isAnimate
        self.hasLoader = hasLoader
        super.init(frame: .zero)
        commonInit()
        addTarget(self, action: #selector(primaryButtonWasTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - FMConfigureLayoutProtocol
    
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
        self.setTitleColor(.clear, for: .normal)
        loadingIndicator.showLoading(self)
        primaryDelegate.handleButtonTapped(self)
    }
    
}

//MARK: - FMPrimaryButtonDisableHideDelagate
extension FMPrimaryButton: FMPrimaryButtonHideDelagate {
    func hideLoader() {
        self.setTitleColor(.white, for: .normal)
        loadingIndicator.stop()
    }
}

