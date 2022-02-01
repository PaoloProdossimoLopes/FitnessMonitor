//
//  FMHomeViewController.swift
//  CalcCal
//
//  Created by Paolo Prodossimo Lopes on 29/01/22.
//

import UIKit

typealias FMHomeViewControllerProtocol = (FMBaseViewController)

final class FMHomeViewController: FMHomeViewControllerProtocol {
    
    var service: FMServiceManager = .shared
    
    private lazy var leftBarButton: UIBarButtonItem = {
        let icon = UIImage(systemName: "person.crop.circle")?
            .withTintColor(.red, renderingMode: .alwaysOriginal)
        let button = UIBarButtonItem(
            image: icon,
            style: .plain,
            target: self,
            action: #selector(leftBarButtonHandleTapped)
        )
        return button
    }()
    
    private lazy var rightBarButton: UIBarButtonItem = {
        let icon = UIImage(systemName: "xmark.circle")?
            .withTintColor(.red, renderingMode: .alwaysOriginal)
        let button = UIBarButtonItem(
            image: icon,
            style: .plain,
            target: self,
            action: #selector(rightBarButtonHandleTapped)
        )
        return button
    }()
    
    //MARK: - Constructor
    
    static func intantiate() -> UINavigationController {
        let controller = FMHomeViewController()
        let nav = UINavigationController(rootViewController: controller)
        return nav
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: - FMConfigureLayourProtocol
    override func configureStyle() {
        super.configureStyle()
        
        navigationItem.title = "HOME"
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func getTabIcon() -> UITabBarItem {
        if let icon = UIImage(named: "fitness.monitor.icon.default") {
            let item = UITabBarItem(
                title: nil,
                image: FMImageFormatter.resizeImage(image: icon, targetSize: .init(width: 40, height: 40)),
                tag: 1
            )
            return item
        }
        return UITabBarItem(title: nil, image: UIImage(systemName: "xmark.octagon"), tag: 0)
    }
    
    @objc private func leftBarButtonHandleTapped() {
        print("TAPPED")
    }
    
    @objc private func rightBarButtonHandleTapped() {
        print("TAPPED")
        service.logOut { completed in
            if completed {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

final class FMHomeApartedView: FMApartedBaseView {
    
}
