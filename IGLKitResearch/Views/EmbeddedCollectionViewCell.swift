//
//  EmbeddedCollectionViewCell.swift
//  IGLKitResearch
//
//  Created by Digital Khrisna on 23/04/18.
//  Copyright © 2018 Digital Khrisna. All rights reserved.
//

import UIKit

final class EmbeddedCollectionViewCell: UICollectionViewCell {
    
    override var reuseIdentifier: String? {
        return "EmbeddedCollectionViewCell"
    }
    
    var number: Int?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
//        view.register(CenterLabelCell.self, forCellWithReuseIdentifier: "CenterLabelCell")
//        view.dataSource = self
//        view.delegate = self
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
//        collectionView.reloadData()
    }
}

//extension EmbeddedCollectionViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let number = number else { return 0 }
//        return number
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CenterLabelCell", for: indexPath) as! CenterLabelCell
//        cell.text = "\(indexPath.row + 1)"
//        cell.backgroundColor = .green
//        return cell
//    }
//}
//
//extension EmbeddedCollectionViewCell: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
//}
//
//extension EmbeddedCollectionViewCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = collectionView.frame.height
//        return CGSize(width: height, height: height)
//    }
//}
