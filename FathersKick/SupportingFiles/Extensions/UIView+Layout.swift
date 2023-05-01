//
//  UIView+Layout.swift
//  FathersKick
//
//  Created by George Weaver on 01.05.2023.
//

import UIKit

extension UIView {
    
    func addSubviewsWithoutAutoresizing(_ subviews: UIView...) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
