//
//  WithButtonsCoordinator.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

import Foundation
import UIKit

final class WithButtonsCoordinator {

    private var withGradientCoordinator: WithGradientCoodinator
    private var navigationController: UINavigationController?
    
    init() {
        withGradientCoordinator = WithGradientCoodinator()
    }
    
    func start() -> UINavigationController {
        let model = WithButtonsViewModelImp()
        bindViewModel(model: model)
        let vc = WithButtonsVC(viewModel: model)
        let nav = UINavigationController(rootViewController: vc)
        navigationController = nav
        return nav
    }
    
    func bindViewModel(model: WithButtonsViewModel) {
        model.routing = { flow in
            switch flow {
            case .toModalScreen:
                self.toScreenWithGradient()
            }
        }
    }
    
    private func toScreenWithGradient() {
        let vc = withGradientCoordinator.start()
        navigationController?.present(vc, animated: true)
    }
}
