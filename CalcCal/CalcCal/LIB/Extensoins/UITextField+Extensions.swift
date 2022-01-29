//
//  UITextField+Extensions.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 28/01/22.
//

import UIKit

extension UITextField {
    
    func setPlaceholderColor(_ color: UIColor) {
        self.attributedPlaceholder = .init(
            string: self.placeholder ?? "",
            attributes: [.foregroundColor: color])
    }
    
}
