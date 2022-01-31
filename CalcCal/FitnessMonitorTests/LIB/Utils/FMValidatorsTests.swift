//
//  FMValidatorsTests.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest

@testable import CalcCal

final class FMValidatorsTests: XCTestCase {
    
    func test_validateEmail() {
        XCTAssertTrue("test@test.com".validateAsEmail())
        XCTAssertFalse("testtest.com".validateAsEmail())
        XCTAssertFalse("test@testcom".validateAsEmail())
        XCTAssertFalse("@test.com".validateAsEmail())
    }
    
    func test_wekestPasswordValidate() {
        XCTAssertTrue(FMValidators.validateAsWeakestPasswordForce("A0000000"))
        XCTAssertFalse(FMValidators.validateAsWeakestPasswordForce("A000000"))
        XCTAssertFalse(FMValidators.validateAsWeakestPasswordForce("00000000"))
        XCTAssertFalse(FMValidators.validateAsWeakestPasswordForce("AAAAAAAA"))
    }
    
    func test_weakPasswordValidate() {
        XCTAssertTrue(FMValidators.validateAsWeakPasswordForce("abc123#@"))
        XCTAssertFalse(FMValidators.validateAsWeakPasswordForce("A000000"))
        XCTAssertFalse(FMValidators.validateAsWeakPasswordForce("A#####"))
        XCTAssertFalse(FMValidators.validateAsWeakPasswordForce("00000000"))
        XCTAssertFalse(FMValidators.validateAsWeakPasswordForce("AAAAAAAA"))
    }
    
    func test_mediumPasswordValidate() {
        XCTAssertTrue(FMValidators.validateAsMediumPasswordForce("Abc12309das"))
        XCTAssertFalse(FMValidators.validateAsMediumPasswordForce("A000000"))
        XCTAssertFalse(FMValidators.validateAsMediumPasswordForce("A#####"))
        XCTAssertFalse(FMValidators.validateAsMediumPasswordForce("00000000"))
        XCTAssertFalse(FMValidators.validateAsMediumPasswordForce("a4234234#@#"))
    }
    
    func test_strongPasswordValidate() {
        XCTAssertTrue(FMValidators.validateAsStrongPasswordForce("Abc12309das#@"))
        XCTAssertFalse(FMValidators.validateAsStrongPasswordForce("A000000"))
        XCTAssertFalse(FMValidators.validateAsStrongPasswordForce("A#####"))
        XCTAssertFalse(FMValidators.validateAsStrongPasswordForce("00000000"))
        XCTAssertFalse(FMValidators.validateAsStrongPasswordForce("a4234234#@#"))
    }
    
    func test_strongestPasswordValidate() {
        XCTAssertTrue(FMValidators.validateAsStrongestPasswordForce("Abc1239#@"))
        XCTAssertTrue(FMValidators.validateAsStrongestPasswordForce("Abc12309#@"))
        XCTAssertFalse(FMValidators.validateAsStrongestPasswordForce("Abc12309das#@asdaaasd"))
        XCTAssertFalse(FMValidators.validateAsStrongestPasswordForce("A000000"))
        XCTAssertFalse(FMValidators.validateAsStrongestPasswordForce("A#####"))
        XCTAssertFalse(FMValidators.validateAsStrongestPasswordForce("00000000"))
        XCTAssertFalse(FMValidators.validateAsStrongestPasswordForce("a4234234#@#"))
    }
    
}
