//
//  AppCoordinator.swift
//  FathersKick
//
//  Created by George Weaver on 06.05.2023.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    private var withButtonsCoordinator: WithButtonsCoordinator
    private var withGradientCoordinator: WithGradientCoodinator
    private var navigationController: UINavigationController?
    
    init() {
        withButtonsCoordinator = WithButtonsCoordinator()
        withGradientCoordinator = WithGradientCoodinator()
    }
    
    func start() -> UIViewController {
        let navController = UINavigationController()
        navigationController = navController
        let controller = withButtonsCoordinator.start()
        navController.setViewControllers([controller], animated: true)
        return navController
    }
}
