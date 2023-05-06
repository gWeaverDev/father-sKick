//
//  ButtonCell.swift
//  FathersKick
//
//  Created by George Weaver on 04.05.2023.
//

import Foundation
import UIKit

protocol ButtonCellDelegate: AnyObject {
    func toModalScreen()
}

final class ButtonCell: UITableViewCell {
    
    enum ButtonsActions: Int {
        case first, second, third
    }
    
    struct Model {
        let text: String
        let actionType: ButtonsActions
    }
    
    override var reuseIdentifier: String? {
        return String(describing: self)
    }
    
    weak var delegate: ButtonCellDelegate?
    
    private let button = UIButton(type: .custom)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAppearance()
        configureButton()
        addButtonActions()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle("", for: .normal)
        button.tag = ButtonsActions.first.rawValue
    }
    
    func fill(with model: Model) {
        button.setTitle(model.text, for: .normal)
        button.tag = model.actionType.rawValue
    }
    
    private func setupAppearance() {
        contentView.backgroundColor = .white
    }
    
    private func setupLayout() {
        contentView.addSubviewsWithoutAutoresizing(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            button.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 25),
            button.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -25),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
    }
}

// MARK: - Configure Button

extension ButtonCell {
    
    private func configureButton() {
        
        let image = UIImage(systemName: "arrow.right.circle.fill")?.withRenderingMode(.alwaysTemplate)
        button.layer.cornerRadius = 10
        button.showPulseAnimation()
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .systemBlue
            configuration.baseForegroundColor = .white
            configuration.titleAlignment = .center
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
            configuration.image = image
            configuration.imagePlacement = .trailing
            configuration.imagePadding = 8
            
            button.configuration = configuration
            button.configurationUpdateHandler = { button in
                switch button.state {
                case .highlighted:
                    button.isHighlighted = false
                default:
                    break
                }
            }
        } else {
            button.backgroundColor = .systemBlue
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(.white, for: .normal)
            button.contentEdgeInsets = .init(top: 10, left: 14, bottom: 10, right: 14)
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.setImage(image, for: .normal)
            button.tintColor = .white
            button.semanticContentAttribute = .forceRightToLeft
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            button.isHighlighted = false
            button.adjustsImageWhenHighlighted = false
        }
    }
    
    private func addButtonActions() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc private func buttonDidTap(_ sender: UIButton) {
        guard let buttonAction = ButtonsActions(rawValue: sender.tag) else { return }
        switch buttonAction {
        case .first:
            break
        case .second:
            break
        case .third:
            delegate?.toModalScreen()
        }
    }
    
}

extension ButtonCell {
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            button.backgroundColor = .gray
            button.setTitleColor(.lightGray, for: .normal)
        } else {
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
        }
    }
}
