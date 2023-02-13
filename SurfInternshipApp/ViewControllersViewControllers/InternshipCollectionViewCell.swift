//
//  InternshipCollectionViewCell.swift
//  SurfInternshipApp
//
//  Created by igor s on 12.02.2023.
//

import UIKit

class InternshipCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    static let cellID = "InternshipCollectionViewCell"
    
    var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Override
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                self.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
                self.title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                self.title.textColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
                self.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
            }
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 12
    }
}
