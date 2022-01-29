//
//  ConfigureLayoutProtocol.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 28/01/22.
//

import UIKit

protocol ConfigureLayoutProtocol {
    func commonInit()
    func configureViewHierarchy()
    func configureConstraints()
    func configureStyle()
}

//MARK: - Default implementation
extension ConfigureLayoutProtocol {
    func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    func configureConstraints() { /* Is not nescessary */ }
    func configureStyle() { /* Is not nescessary */ }
}
