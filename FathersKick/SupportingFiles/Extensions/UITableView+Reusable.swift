//
//  UITableView+Reusable.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

import UIKit

extension UITableView {
    
    func register<T: Reusable>(cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}
