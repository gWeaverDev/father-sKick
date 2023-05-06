//
//  WithGradientCoordinator.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

import Foundation
import UIKit

final class WithGradientCoodinator {
    
    enum Flow {
        case exitToRoot
    }
    
    private var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let vc = WithGradientVC()
        bindWithGradientController()
        vc.navigationController?.setViewControllers([vc], animated: true)
        return vc
    }
    
    private func bindWithGradientController() {
        //TODO: - Routing
    }
}


