//
//  FMPrimaryButtonTests.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest

@testable import CalcCal

final class FMPrimaryButtonTest: XCTestCase {
    
    var sut: FMPrimaryButton!
    
    func test_FMPrimaryButton_AssignAllRequiredInheritance() {
        sut = makeSUT()
        XCTAssertInheritance(this: sut!, isInheritance: UIButton.self)
        XCTAssertInheritance(this: sut!, isInheritance: FMConfigureLayoutProtocol.self)
    }
    
    func test_ifTitleIsSetupCorrectly() {
        sut = makeSUT(title: "Test")
        XCTAssertEqual(sut.titleLabel?.text, "Test")
    }
    
    func test_ifInitialStateIsDisable() {
        sut = makeSUT()
        XCTAssertFalse(sut.isEnabled)
        XCTAssertEqual(sut.backgroundColor, .lightGray.withAlphaComponent(0.4))
        XCTAssertEqual(sut.titleLabel?.textColor, .darkGray)
    }
    
    func test_ifButtonWasEnableIfAllValidationsAreTRUE() {
        sut = makeSUT()
        let validations = [true]
        sut.validateButton(conditions: validations)
        XCTAssertTrue(sut.isEnabled)
        XCTAssertEqual(sut.backgroundColor, .red)
        XCTAssertEqual(sut.titleLabel?.textColor, .white)
    }
    
    func test_ifButtonWasDiableIfJustOneValidationsAreFalse() {
        sut = makeSUT()
        let validations = [true, false]
        sut.validateButton(conditions: validations)
        XCTAssertFalse(sut.isEnabled)
        XCTAssertEqual(sut.backgroundColor, .lightGray.withAlphaComponent(0.4))
        XCTAssertEqual(sut.titleLabel?.textColor, .darkGray)
    }
    
}

//MARK: - Helpers
extension FMPrimaryButtonTest {
    func makeSUT(
        title: String = "",
        isAnimate: Bool = true
    ) -> FMPrimaryButton {
        let sut = FMPrimaryButton(self, btnTitle: title, isAnimate: isAnimate)
        return sut
    }
}

//MARK: - FMPrimaryButtonDelegate
extension FMPrimaryButtonTest: FMPrimaryButtonDelegate {
    func handleButtonTapped(_ loader: FMPrimaryButtonHideDelagate) {
        /*Is not nescessary*/
    }
}
