//
//  LabelSectionController.swift
//  IGLKitResearch
//
//  Created by Digital Khrisna on 24/04/18.
//  Copyright © 2018 Digital Khrisna. All rights reserved.
//

import IGListKit
import UIKit

final class LabelSectionController: ListSectionController {
    private var object: String?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: SelfSizingCell.self, for: self, at: index) as? SelfSizingCell else {
            fatalError()
        }
        
        cell.text = object
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
    
    override func didSelectItem(at index: Int) {
        
    }
}
