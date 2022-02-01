//
//  FMBaseViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

typealias FMBaseViewControllerProtocol = (
    UIViewController & FMConfigureLayoutProtocol
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
        self.navigationController?.view.backgroundColor = .white
        configureNavBarStyle()
    }
    
    private func configureNavBarStyle() {
        if let navBar = self.navigationController?.navigationBar {
            navBar.largeTitleTextAttributes = [.foregroundColor : UIColor.black]
            navBar.titleTextAttributes = [.foregroundColor : UIColor.black]
            
            navBar.isTranslucent = false
            navBar.backgroundColor = .white
            navBar.barTintColor = .white
        }
    }
    
}
