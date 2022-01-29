//
//  CCPrimaryButtonTests.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest
@testable import CalcCal

final class CCPrimaryButtonTest: XCTestCase {
    
    var sut: CCPrimaryButton!
    
    func test_CCPrimaryButton_AssignAllRequiredInheritance() {
        sut = makeSUT()
        XCTAssertInheritance(this: sut!, isInheritance: UIButton.self)
        XCTAssertInheritance(this: sut!, isInheritance: ConfigureLayoutProtocol.self)
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
extension CCPrimaryButtonTest {
    func makeSUT(
        title: String = "",
        isAnimate: Bool = true
    ) -> CCPrimaryButton {
        let sut = CCPrimaryButton(self, btnTitle: title, isAnimate: isAnimate)
        return sut
    }
}

//MARK: - CCPrimaryButtonDelegate
extension CCPrimaryButtonTest: CCPrimaryButtonDelegate {
    func handleButtonTapped() { /*Is not nescessary*/  }
}
