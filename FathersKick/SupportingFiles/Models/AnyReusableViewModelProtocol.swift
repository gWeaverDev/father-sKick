//
//  AnyReusableViewModelProtocol.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

import UIKit

protocol AnyReusableViewModelProtocol: AnyObject {

    static var viewClass: UIView.Type { get }
    static var reuseIdentifier: String { get }
}

extension AnyReusableViewModelProtocol {

    private static var cellClassName: String {
        return String(describing: viewClass)
    }

    static var reuseIdentifier: String {
        return cellClassName
    }
}
