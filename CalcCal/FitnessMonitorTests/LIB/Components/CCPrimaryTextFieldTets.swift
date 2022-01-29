//
//  CCPrimaryTextFieldTets.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest
@testable import CalcCal

final class CCPrimaryTextFieldTests: XCTestCase {
    
    var sut: CCPrimaryTextField!
    
    func test_CCPrimaryTextFieldTests_inherance_IsCorrect() {
        XCTAssertInheritance(this: makeSUT(), isInheritance: UIStackView.self)
        XCTAssertInheritance(this: makeSUT().mainTextField, isInheritance: UITextField.self)
        XCTAssertInheritance(this: makeSUT().iconImage, isInheritance: UIImageView.self)
        XCTAssertInheritance(this: makeSUT().validationMessageLabel, isInheritance: UILabel.self)
        XCTAssertInheritance(this: makeSUT().clearButton, isInheritance: UIButton.self)
        XCTAssertInheritance(this: makeSUT(), isInheritance: ConfigureLayoutProtocol.self)
    }
    
    func test_iconImage_wasInitialized() {
        let expect = UIImage(systemName: "xmark")
        XCTAssertEqual(makeSUT(image: "xmark").iconImage.image, expect)
    }
    
    func test_textField_wasInitializedEmpty() {
        XCTAssertTrue(makeSUT().mainTextField.text!.isEmpty)
    }
    
    func test_textField_isPupulatinCorrect() {
        sut = makeSUT()
        sut.mainTextField.text = "message"
        XCTAssertFalse(sut.mainTextField.text!.isEmpty)
        XCTAssertEqual(sut.mainTextField.text, "message")
    }
    
    func test_textFieldIsSecure() {
        XCTAssertTrue(makeSUT(isSecure: true).mainTextField.isSecureTextEntry)
    }
    
    func test_messageErrorIndicator_isShowing() {
        sut = makeSUT()
        
        sut.mainTextField.text = "test"
        sut.mainTextField.delegate?.textFieldDidChangeSelection?(sut.mainTextField)
        
        XCTAssertFalse(sut.getValidationStatus())
        XCTAssertFalse(sut.validationMessageLabel.isHidden)
        XCTAssertFalse(sut.validationMessageLabel.text!.isEmpty)
    }
    
    func test_messageErrorIndicator_isNotShowing() {
        sut = makeSUT()
        
        sut.mainTextField.text = "test@test.com"
        sut.mainTextField.delegate?.textFieldDidChangeSelection?(sut.mainTextField)
        
        XCTAssertTrue(sut.getValidationStatus())
        XCTAssertTrue(sut.validationMessageLabel.isHidden)
        XCTAssertFalse(sut.validationMessageLabel.text!.isEmpty)
    }
    
    func test_mainTextField_whenTFDidBeginEdit() {
        sut = makeSUT()
        sut.mainTextField.delegate?.textFieldDidBeginEditing?(sut.mainTextField)
        XCTAssertEqual(sut.dividerView.backgroundColor, .red)
        XCTAssertEqual(sut.iconImage.tintColor, .red)
        XCTAssertEqual(sut.clearButton.tintColor, .red)
        XCTAssertFalse(sut.clearButton.isHidden)
    }
    
    func test_mainTextField_whenTextFieldDidEndEditing() {
        sut = makeSUT()
        sut.mainTextField.delegate?.textFieldDidEndEditing?(sut.mainTextField)
        XCTAssertEqual(sut.dividerView.backgroundColor, .lightGray)
        XCTAssertEqual(sut.iconImage.tintColor, .lightGray)
        XCTAssertEqual(sut.clearButton.tintColor, .lightGray)
        XCTAssertTrue(sut.clearButton.isHidden)
    }
    
    func test_verifyIfExtraButtonAction_wasConfigureCorrect() {
        sut =  makeSUT(isSecure: true)
        var expect = UIImage(systemName: "eye.circle.fill")
        XCTAssertEqual(sut.clearButton.image(for: .normal), expect)
        
        sut =  makeSUT()
        expect = UIImage(systemName: "x.circle.fill")
        XCTAssertEqual(sut.clearButton.image(for: .normal), expect)
    }
    
    func test_clearButtonCleanText() {
        sut = makeSUT()
        sut.mainTextField.text = "test"
        sut.clearButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.mainTextField.text, "")
    }
    
    func test_clearButtonWhenIsSecureField_shouldToogleVisibility() {
        sut = makeSUT(isSecure: true)
        sut.mainTextField.text = "test"
        sut.clearButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.mainTextField.text, "test")
        XCTAssertEqual(sut.mainTextField.isSecureTextEntry, false)
    }

}

//MARK: - Helpers
extension CCPrimaryTextFieldTests {
    func makeSUT(
        image: String = "xmark",
        placeholder: String = "placeholder here",
        customInvalidMessage: String = "error message here ...",
        isSecure: Bool = false,
        changesIsAnimate: Bool = true
    ) -> CCPrimaryTextField {
        let sut = CCPrimaryTextField.init(
            self, image: image,
            placeholder: placeholder,
            customInvalidMessage: customInvalidMessage,
            isSecure: isSecure,
            changesIsAnimate: changesIsAnimate,
            validation: { text in return text.validateAsEmail() }
        )
        
        return sut
    }
}

//MARK: - CCPrimaryTextFieldDelegate
extension CCPrimaryTextFieldTests: CCPrimaryTextFieldDelegate {
    func notifyWhenTextFieldWasChanged() { }
}

