//
//  FMCalculatorViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 31/01/22.
//

import Foundation
import UIKit

final class FMCalculatorViewController: FMBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureStyle() {
        super.configureStyle()
        navigationItem.title = "CALCULADORA"
    }
    
    func getTabIcon() -> UITabBarItem {
        if let icon = UIImage(systemName: "circle.grid.3x3") {
            let item = UITabBarItem(
                title: nil,
                image: icon,
                tag: 3
            )
            return item
        }
        return UITabBarItem(title: nil, image: UIImage(systemName: "xmark.octagon"), tag: 0)
    }
    
}

