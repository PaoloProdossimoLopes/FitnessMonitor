//
//  UITextField+ExtensionsTests.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest
@testable import CalcCal

final class UITextFieldExtensionsTests: XCTestCase {
    
    func test_callSetPlaceholderColor_shouldBecamediferentColorInPlaceholder() {
        let sut = UITextField()
        sut.placeholder = "sut"
        sut.setPlaceholderColor(.red)
       
        let atribute = getAtributedPlaceholder(sut, atribute: .foregroundColor) as! UIColor
        XCTAssertEqual(atribute, .red)
    }
    
}

//MARK: - Helpers
private extension UITextFieldExtensionsTests {
    func getAtributedPlaceholder(_ textField: UITextField, atribute: NSAttributedString.Key) -> Any? {
        return textField.attributedPlaceholder?.attribute(atribute, at: 0, effectiveRange: nil)
    }
}
