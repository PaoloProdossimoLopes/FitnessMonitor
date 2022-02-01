//
//  FMCalendarViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 31/01/22.
//

import UIKit

final class FMCalendarViewController: FMBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    override func configureStyle() {
        super.configureStyle()
        navigationItem.title = "CALENDARIO"
    }
    
    func getTabIcon() -> UITabBarItem {
        if let icon = UIImage(systemName: "calendar") {
            let item = UITabBarItem(
                title: nil,
                image: icon,
                tag: 0
            )
            return item
        }
        return UITabBarItem(title: nil, image: UIImage(systemName: "xmark.octagon"), tag: 0)
    }

    
}
