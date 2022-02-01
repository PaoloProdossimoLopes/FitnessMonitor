//
//  FMOrchestradorTabViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 31/01/22.
//

import UIKit

final class FMOrchestradorTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureTabs()
        configureStyle()
    }
    
    private func configureStyle() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        
        selectedIndex = 1
        
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .lightGray.withAlphaComponent(0.4)
        tabBar.contentMode = .scaleAspectFill
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.backgroundColor = .white
        tabBar.standardAppearance.selectionIndicatorImage = .strokedCheckmark
    }
    
    private func configureTabs() {
        let homeController = FMHomeViewController()
        let homeNav = UINavigationController(rootViewController: homeController)
        homeNav.tabBarItem = homeController.getTabIcon()
        
        let calculatoeController = FMCalculatorViewController()
        let calcNav = UINavigationController(rootViewController: calculatoeController)
        calcNav.tabBarItem = calculatoeController.getTabIcon()

        let calendarController = FMCalendarViewController()
        let calendarNav = UINavigationController(rootViewController: calendarController)
        calendarNav.tabBarItem = calendarController.getTabIcon()

        viewControllers = [calcNav, homeNav, calendarNav]
    }
    
}
