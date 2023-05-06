//
//  UIButton+Animation.swift
//  FathersKick
//
//  Created by George Weaver on 05.05.2023.
//

import UIKit

extension UIButton {
    
    func showPulseAnimation() {
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter, .touchDownRepeat])
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(
            withDuration: 0.15,
            delay: 0,
            usingSpringWithDamping: 0.1,
            initialSpringVelocity: 3,
            options: [.beginFromCurrentState, .transitionCrossDissolve, .allowUserInteraction],
            animations: { button.transform = transform },
            completion: nil
        )
    }
    
    @objc
    private func animateDown(_ sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9))
    }
    
    @objc
    private func animateUp(_ sender: UIButton) {
        animate(sender, transform: .identity)
    }
}
