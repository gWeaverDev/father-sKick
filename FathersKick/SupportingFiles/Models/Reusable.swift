//
//  Reusable.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
