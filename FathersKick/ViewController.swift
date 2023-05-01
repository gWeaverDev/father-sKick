//
//  ViewController.swift
//  FathersKick
//
//  Created by George Weaver on 01.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    enum Constants {
        static let gradientViewSize = CGSize(width: 100, height: 100)
    }
    
    private let gradientView = GradientView(colorTop: .blue, colorBottom: .red)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupLayout()
    }
    
    private func setupAppearance() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubviewsWithoutAutoresizing(gradientView)
        
        NSLayoutConstraint.activate([
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            
            gradientView.heightAnchor.constraint(equalToConstant: Constants.gradientViewSize.height),
            gradientView.widthAnchor.constraint(equalToConstant: Constants.gradientViewSize.width)
        ])
    }


}

