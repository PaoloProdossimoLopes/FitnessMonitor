//
//  FMSignInViewControllerTest.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest
@testable import CalcCal

final class FMSignInViewControllerTest: XCTestCase {
    
    var controllerSUT: FMSignInViewController!
    var componentsSUT: FMSignInApartedView!
    
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
    
    func test_checkIfBGIsWhite() {
        controllerSUT = makeSUTs().controller
        XCTAssertEqual(controllerSUT.view.backgroundColor, .white)
    }
    
    func test_UIComponentsIsNotNill() {
        controllerSUT = makeSUTs().controller
        _ = controllerSUT.view //start view
        XCTAssertNotNil(controllerSUT.FMApartedView)
    }
}

//MARK: - Helpers
private extension FMSignInViewControllerTest {
    func makeSUTs() -> (controller: FMSignInViewController, components: FMSignInApartedView) {
        let controller = FMSignInViewController()
        _ = controller.view
        controller.viewDidLoad()
        let components = FMSignInApartedView(controller)
        return (controller, components)
    }
}

