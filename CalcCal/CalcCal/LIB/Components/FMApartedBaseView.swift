//
//  FMApartedBaseView.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 30/01/22.
//

import UIKit

typealias FMApartedBaseViewProtocol = (
    UIView & ConfigureLayoutProtocol
)

class FMApartedBaseView: FMApartedBaseViewProtocol {
    
    func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    func configureViewHierarchy() {
        
    }
    
    func configureConstraints() {
        
    }
    
    func configureStyle() {
        
    }
    
}

