//
//  String+Extensions.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 28/01/22.
//

import UIKit

extension String {
    
    func validateAsEmail() -> Bool { return FMValidators.validateAsEmail(self) }
    
    var underLined: NSAttributedString {
        FMTextStylesFormatters.underlinePropertieGetter(self)
    }
    
}
