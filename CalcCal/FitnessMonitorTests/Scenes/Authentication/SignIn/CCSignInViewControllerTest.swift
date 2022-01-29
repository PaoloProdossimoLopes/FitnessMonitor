//
//  CCSignInViewControllerTest.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest
@testable import CalcCal

final class CCSignInViewControllerTest: XCTestCase {
    
    var controllerSUT: CCSignInViewController!
    var componentsSUT: CCSignInUIComponents!
    
    func test_verifyIfEmailTFwasCorreectInformations() {
        (_, componentsSUT) = makeSUTs()
        XCTAssertEqual(componentsSUT.emailTF.mainTextField.placeholder, "Email ...")
        XCTAssertEqual(componentsSUT.emailTF.iconImage.image, UIImage(systemName: "envelope"))
    }
    
    func test_verifyIfPasswordTFwasCorreectInformations() {
        (_, componentsSUT) = makeSUTs()
        XCTAssertEqual(componentsSUT.passwordTF.mainTextField.placeholder, "Password ...")
        XCTAssertEqual(componentsSUT.passwordTF.iconImage.image, UIImage(systemName: "lock"))
    }
    
    func test_checkIfStackViewConstainsTheTextFields() {
        componentsSUT = makeSUTs().components
        XCTAssertTrue(componentsSUT.textFieldStackView.subviews.contains(componentsSUT.emailTF))
        XCTAssertTrue(componentsSUT.textFieldStackView.subviews.contains(componentsSUT.passwordTF))
    }
    
    func test_UIComponentsIsNotNill() {
        controllerSUT = makeSUTs().controller
        _ = controllerSUT.view //start view
        XCTAssertNotNil(controllerSUT.UIComponents)
    }
    
}

//MARK: - Helpers
private extension CCSignInViewControllerTest {
    func makeSUTs() -> (controller: CCSignInViewController, components: CCSignInUIComponents) {
        let controller = CCSignInViewController()
        let components = CCSignInUIComponents(controller)
        return (controller, components)
    }
}

