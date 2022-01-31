//
//  FMHomeViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

typealias FMHomeViewControllerProtocol = (FMBaseViewController)

final class FMHomeViewController: FMHomeViewControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    override func configureStyle() {
        view.backgroundColor = .red
    }
    
}
