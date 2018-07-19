//
//  EmbeddedSectionController.swift
//  IGLKitResearch
//
//  Created by Digital Khrisna on 24/04/18.
//  Copyright © 2018 Digital Khrisna. All rights reserved.
//

import IGListKit
import UIKit

final class EmbeddedSectionController: ListSectionController {
    private var number: Int?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext?.containerSize.height ?? 0
        return CGSize(width: height, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as? CenterLabelCell else {
            fatalError()
        }
        
        let value = number ?? 0
        cell.text = "\(value + 1)"
        cell.backgroundColor = .green
        return cell
    }
    
    override func didUpdate(to object: Any) {
        number = object as? Int
    }
}
