//
//  CCValidatorsTests.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest
@testable import CalcCal

final class CCValidatorsTests: XCTestCase {
    
    func test_validateEmail() {
        XCTAssertTrue("test@test.com".validateAsEmail())
        XCTAssertFalse("testtest.com".validateAsEmail())
        XCTAssertFalse("test@testcom".validateAsEmail())
        XCTAssertFalse("@test.com".validateAsEmail())
    }
    
    func test_wekestPasswordValidate() {
        XCTAssertTrue(CCValidators.validateAsWeakestPasswordForce("A0000000"))
        XCTAssertFalse(CCValidators.validateAsWeakestPasswordForce("A000000"))
        XCTAssertFalse(CCValidators.validateAsWeakestPasswordForce("00000000"))
        XCTAssertFalse(CCValidators.validateAsWeakestPasswordForce("AAAAAAAA"))
    }
    
    func test_weakPasswordValidate() {
        XCTAssertTrue(CCValidators.validateAsWeakPasswordForce("abc123#@"))
        XCTAssertFalse(CCValidators.validateAsWeakPasswordForce("A000000"))
        XCTAssertFalse(CCValidators.validateAsWeakPasswordForce("A#####"))
        XCTAssertFalse(CCValidators.validateAsWeakPasswordForce("00000000"))
        XCTAssertFalse(CCValidators.validateAsWeakPasswordForce("AAAAAAAA"))
    }
    
    func test_mediumPasswordValidate() {
        XCTAssertTrue(CCValidators.validateAsMediumPasswordForce("Abc12309das"))
        XCTAssertFalse(CCValidators.validateAsMediumPasswordForce("A000000"))
        XCTAssertFalse(CCValidators.validateAsMediumPasswordForce("A#####"))
        XCTAssertFalse(CCValidators.validateAsMediumPasswordForce("00000000"))
        XCTAssertFalse(CCValidators.validateAsMediumPasswordForce("a4234234#@#"))
    }
    
    func test_strongPasswordValidate() {
        XCTAssertTrue(CCValidators.validateAsStrongPasswordForce("Abc12309das#@"))
        XCTAssertFalse(CCValidators.validateAsStrongPasswordForce("A000000"))
        XCTAssertFalse(CCValidators.validateAsStrongPasswordForce("A#####"))
        XCTAssertFalse(CCValidators.validateAsStrongPasswordForce("00000000"))
        XCTAssertFalse(CCValidators.validateAsStrongPasswordForce("a4234234#@#"))
    }
    
    func test_strongestPasswordValidate() {
        XCTAssertTrue(CCValidators.validateAsStrongestPasswordForce("Abc1239#@"))
        XCTAssertTrue(CCValidators.validateAsStrongestPasswordForce("Abc12309#@"))
        XCTAssertFalse(CCValidators.validateAsStrongestPasswordForce("Abc12309das#@asdaaasd"))
        XCTAssertFalse(CCValidators.validateAsStrongestPasswordForce("A000000"))
        XCTAssertFalse(CCValidators.validateAsStrongestPasswordForce("A#####"))
        XCTAssertFalse(CCValidators.validateAsStrongestPasswordForce("00000000"))
        XCTAssertFalse(CCValidators.validateAsStrongestPasswordForce("a4234234#@#"))
    }
    
}
