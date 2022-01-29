//
//  StringExtensionsTests.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest
@testable import CalcCal

final class StringExtensionsTests: XCTestCase {
    
    func test_validateEmail_isValid() {
        let email: String = "test@test.com"
        XCTAssertTrue(email.validateAsEmail())
    }
    
    func test_validateEmail_isInvalid() {
        let email: String = "test"
        XCTAssertFalse(email.validateAsEmail())
    }
    
}
