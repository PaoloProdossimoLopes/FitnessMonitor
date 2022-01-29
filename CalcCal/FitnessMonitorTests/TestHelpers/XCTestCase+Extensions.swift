//
//  XCTestCase+Extensions.swift
//  FitnessMonitorTests
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import XCTest

extension XCTestCase {
    
    func unwraped<T>(_ propertie: T?, recieveUnwrap: (T) -> Void) {
        if let prop = propertie { recieveUnwrap(prop) }
    }
    
    func XCTAssertType<T>(this: Any, equalTo: T.Type) {
        XCTAssertTrue((this) is T)
    }

    func XCTAssertInheritance<T>(this: Any, isInheritance: T.Type) {
        XCTAssertType(this: this, equalTo: isInheritance)
    }
}
