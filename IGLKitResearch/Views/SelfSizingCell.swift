//
//  SelfSizingCell.swift
//  IGLKitResearch
//
//  Created by Digital Khrisna on 23/04/18.
//  Copyright © 2018 Digital Khrisna. All rights reserved.
//

import UIKit

final class SelfSizingCell: UICollectionViewCell {
    override var reuseIdentifier: String? {
        return "SelfSizingCell"
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var text: String? {
        set {
            label.text = newValue
        }
        get {
            return label.text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.addSubview(label)
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        var newFrame = layoutAttributes.frame
        
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }
}
