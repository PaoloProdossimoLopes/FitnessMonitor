//
//  String+Extensions.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 28/01/22.
//

import Foundation

extension String {
    func validateAsEmail() -> Bool { return CCValidators.validateAsEmail(self) }
}
