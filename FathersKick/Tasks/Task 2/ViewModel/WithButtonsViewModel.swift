//
//  WithButtonsViewModel.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

import Foundation
import UIKit

protocol WithButtonsViewModel: AnyObject {
    var routing: (WithButtonsViewModelFlow) -> Void { get set }
    func getData(_ completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellData(for indexPath: IndexPath) -> AnyTableViewCellModelProtocol
    func toModalScreen()
}

enum WithButtonsViewModelFlow {
    case toModalScreen
}

final class WithButtonsViewModelImp: WithButtonsViewModel {
    
    private var cellModels: [AnyTableViewCellModelProtocol] = []
    
    var routing: (WithButtonsViewModelFlow) -> Void = { _ in }
    
    func getData(_ completion: @escaping () -> Void) {
        let firstModel = ButtonTableViewCellVM(
            model: .init(text: "First button jsadjfsdfsfdsfdsfsdfsdf", actionType: .first)
        )
        let secondModel = ButtonTableViewCellVM(
            model: .init(text: "2nd medium button", actionType: .second)
        )
        let thirdModel = ButtonTableViewCellVM(
            model: .init(text: "The magic large third button", actionType: .third)
        )
        
        cellModels = [firstModel, secondModel, thirdModel]
    }
    
    func numberOfRows() -> Int {
        cellModels.count
    }
    
    func cellData(for indexPath: IndexPath) -> AnyTableViewCellModelProtocol {
        return cellModels[indexPath.row]
    }
    
    func toModalScreen() {
        routing(.toModalScreen)
    }
}
