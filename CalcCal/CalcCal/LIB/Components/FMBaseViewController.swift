//
//  FMBaseViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

typealias FMBaseViewControllerProtocol = (
    UIViewController & ConfigureLayoutProtocol
)

class FMBaseViewController: FMBaseViewControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func configureViewHierarchy() { }
    
    func configureConstraints() { }
    
    func configureStyle() {
        self.view.backgroundColor = .white
    }
    
}
