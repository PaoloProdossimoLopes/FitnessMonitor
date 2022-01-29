//
//  CCPrimaryTextField.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 28/01/22.
//

import UIKit

typealias CCPrimaryTextFieldProtocol = (
    UIStackView & ConfigureLayoutProtocol
)

protocol CCPrimaryTextFieldDelegate: AnyObject {
    func notifyWhenTextFieldWasChanged()
}

final class CCPrimaryTextField: CCPrimaryTextFieldProtocol {
    
    private let invalidMessage: String
    private let primaryDelegate: CCPrimaryTextFieldDelegate
    private var validation: ((String) -> Bool)
    private var isSecure: Bool
    private var changesIsAnimate: Bool
    
    //MARK: - Components
    private(set) lazy var iconImage: UIImageView = {
        let image = UIImage(systemName: "xmark")
        let iv = UIImageView(image: image)
        iv.tintColor = .lightGray
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private(set) lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setImage(configureImageButton(), for: .normal)
        button.tintColor = .lightGray
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonHandleTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var mainTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.placeholder = "Placeholder ..."
        tf.setPlaceholderColor(.lightGray)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private(set) lazy var validationMessageLabel: UILabel = {
        let label = UILabel()
        label.text = invalidMessage
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    private(set) lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var HStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImage, mainTextField, clearButton])
        stack.spacing = 8
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Constructor
    
    init(
        _ delegate: CCPrimaryTextFieldDelegate,
        image: String,
        placeholder: String,
        customInvalidMessage: String = "❗️Esse campo contem informaçoes invalidas",
        isSecure: Bool = false,
        changesIsAnimate: Bool = true,
        validation: @escaping ((String) -> Bool) = { (_) -> Bool in  return true }
    ) {
        self.primaryDelegate = delegate
        self.invalidMessage = customInvalidMessage
        self.isSecure = isSecure
        self.changesIsAnimate = changesIsAnimate
        self.validation = validation
        super.init(frame: .zero)
        self.iconImage.image = UIImage(systemName: image)
        self.mainTextField.placeholder = placeholder
        self.mainTextField.isSecureTextEntry = isSecure
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ConfigureLayoutProtocol
    
    func configureViewHierarchy() {
        addArrangedSubview(HStackView)
        addArrangedSubview(validationMessageLabel)
        addArrangedSubview(dividerView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            iconImage.widthAnchor.constraint(equalToConstant: 36),
            clearButton.widthAnchor.constraint(equalToConstant: 36),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configureStyle() {
        spacing = 10
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Helpers
    
    private func reloadCCPrimaryTextField(_ isSelected: Bool = false) {
        if changesIsAnimate {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.configureReloadStyles(isSelected)
            }
        } else {
            configureReloadStyles(isSelected)
        }
    }
    
    private func configureReloadStyles(_ isSelected: Bool = false) {
        let color: UIColor = isSelected ? .red : .lightGray
        iconImage.tintColor = color
        clearButton.tintColor = color
        clearButton.isHidden = !isSelected
        dividerView.backgroundColor = color
        mainTextField.setPlaceholderColor(color)
    }
    
    private func validateTextField() {
        if changesIsAnimate {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.reloadMessageErrorAndValidateFields()
            }
        } else {
            reloadMessageErrorAndValidateFields()
        }
    }
    
    private func reloadMessageErrorAndValidateFields() {
        let textFieldIsEmpty: Bool = (mainTextField.text ?? "").isEmpty
        let isValid = textFieldIsEmpty ? true : validation(mainTextField.text ?? "")
        validationMessageLabel.isHidden = isValid
    }
    
    private func configureImageButton() -> UIImage? {
        if isSecure == false { return UIImage(systemName: "x.circle.fill") }
        else { return UIImage(systemName: "eye.circle.fill") }
    }
    
    private func handleTappedHelper() {
        if isSecure == false { mainTextField.text = "" }
        else { mainTextField.isSecureTextEntry.toggle() }
    }
    
    //MARK: - Getters
    
    func getValidationStatus() -> Bool {
        return validation(mainTextField.text ?? "")
    }
    
    //MARK: - Selector
    
    @objc private func closeButtonHandleTapped() {
        if changesIsAnimate {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.handleTappedHelper()
            }
        } else {
            handleTappedHelper()
        }
    }
    
}

//MARK: - UITextFieldDelegate
extension CCPrimaryTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        reloadCCPrimaryTextField(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        reloadCCPrimaryTextField(false)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        validateTextField()
        primaryDelegate.notifyWhenTextFieldWasChanged()
    }
    
}
