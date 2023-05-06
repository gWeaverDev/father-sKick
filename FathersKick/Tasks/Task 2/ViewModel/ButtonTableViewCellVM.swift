//
//  ButtonTableViewCellVM.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

import Foundation
import UIKit

final class ButtonTableViewCellVM: TableViewCellModelProtocol {
    
    var buttonColor: UIColor = .systemBlue
    private let model: ButtonCell.Model
    
    init(model: ButtonCell.Model) {
        self.model = model
    }
    
    func configure(_ cell: ButtonCell) {
        cell.fill(with: model)
    }
    
    func changeButtonColor(_ cell: ButtonCell) {
        
    }
}
