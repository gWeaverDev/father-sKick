//
//  GradientView.swift
//  FathersKick
//
//  Created by George Weaver on 01.05.2023.
//

import UIKit

final class GradientView: UIView {
    
    private let colorTop: UIColor
    private let colorBottom: UIColor
    private let gradientFirstPoint: CGPoint
    private let gradientLastPoint: CGPoint
    
    init(
        colorTop: UIColor,
        colorBottom: UIColor,
        startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),
        endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)
    ) {
        self.colorTop = colorTop
        self.colorBottom = colorBottom
        self.gradientFirstPoint = startPoint
        self.gradientLastPoint = endPoint
        super.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = gradientFirstPoint
        gradientLayer.endPoint = gradientLastPoint
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = 20
        
        layer.addSublayer(gradientLayer)
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
    }
}
