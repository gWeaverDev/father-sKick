//
//  UITableView+ViewModel.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

import UIKit

extension UITableView {
    
    func registerCells(withModels models: AnyTableViewCellModelProtocol.Type...) {
        models.forEach {
            register(cellType: $0.viewClass)
        }
    }
    
    func dequeueReusableCell(withModel model: AnyTableViewCellModelProtocol, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: type(of: model).reuseIdentifier, for: indexPath)
    }
}
