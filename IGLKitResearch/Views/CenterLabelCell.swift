//
//  CenterLabelCell.swift
//  IGLKitResearch
//
//  Created by Digital Khrisna on 23/04/18.
//  Copyright © 2018 Digital Khrisna. All rights reserved.
//

import UIKit

final class CenterLabelCell: UICollectionViewCell {
    
    override var reuseIdentifier: String? {
        return "CenterLabelCell"
    }
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
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

