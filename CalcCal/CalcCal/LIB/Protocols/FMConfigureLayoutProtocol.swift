//
//  FMConfigureLayoutProtocol.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 28/01/22.
//

import UIKit

protocol FMConfigureLayoutProtocol {
    func commonInit()
    func configureViewHierarchy()
    func configureConstraints()
    func configureStyle()
}

//MARK: - Default implementation
extension FMConfigureLayoutProtocol {
    func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    func configureConstraints() { /* Is not nescessary */ }
    func configureStyle() { /* Is not nescessary */ }
}
