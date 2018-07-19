//
//  TraditionalViewController.swift
//  IGLKitResearch
//
//  Created by Digital Khrisna on 18/07/18.
//  Copyright © 2018 Digital Khrisna. All rights reserved.
//

import IGListKit
import UIKit

class TraditionalViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
//        layout.estimatedItemSize = CGSize(width: 100, height: 75)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var data: [Any] = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non accumsan dui. Fusce scelerisque malesuada arcu, quis vulputate magna lacinia auctor. Mauris suscipit magna luctus mollis placerat. Praesent a tincidunt tortor, vitae elementum mauris. Quisque sed nibh quis metus suscipit egestas. Cras justo odio, venenatis eu sapien vitae, aliquet consequat sapien. Nam facilisis cursus finibus. Phasellus rutrum lacus ligula, eget faucibus dui venenatis nec. In feugiat nisl ac magna molestie fermentum. Aliquam erat volutpat. Nullam a suscipit sem. Mauris eu mattis nisl. Etiam vestibulum diam nulla, ac vulputate velit ultrices in. Phasellus molestie ornare diam vel pulvinar. Nulla dignissim sapien in justo laoreet, mattis vestibulum metus posuere. Aliquam elementum odio nec erat sollicitudin egestas. Aenean pulvinar, massa eu vulputate volutpat, magna leo eleifend nibh, quis tempus odio enim at erat. Maecenas mi justo, aliquam quis enim non, interdum luctus massa. Nulla congue magna et nunc ultrices, ut gravida tellus mattis. Vivamus augue leo, mollis a accumsan vel, sagittis sit amet leo. Aliquam id ex varius, vehicula mi at, euismod arcu. Phasellus bibendum eros turpis, ut porttitor risus cursus nec. Nulla facilisi. Etiam mattis odio massa. Fusce sed enim sit amet enim congue condimentum. In ut nunc commodo, molestie dui eu, interdum nibh. Nulla placerat suscipit lectus, a cursus neque ultrices in. Sed vitae tristique sem. Praesent euismod et ipsum a convallis. Etiam vel imperdiet nisi, eu facilisis augue. Etiam vel felis ",
        10,
        "Tellus Nibh Ipsum Inceptos",
        "Tellus Nibh Ipsum Inceptos",
        20,
        ]

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        collectionView.register(SelfSizingCell.self, forCellWithReuseIdentifier: "SelfSizingCell")
        collectionView.register(EmbeddedCollectionViewCell.self, forCellWithReuseIdentifier: "EmbeddedCollectionViewCell")

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
//            self.data.insert(5, at: 0)
//            self.collectionView.reloadData()
//        }
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
//            self.data.insert(5, at: 0)
//            self.collectionView.performBatchUpdates({
//                self.collectionView.insertItems(at: [IndexPath(row: 0, section: 0)])
//            }, completion: nil)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
//            var newArray = self.data
//            newArray.insert(5, at: 0)
//            let diffable = ListDiffPaths(fromSection: 0, toSection: 0, oldArray: self.data as! [ListDiffable], newArray: newArray as! [ListDiffable], option: .equality)
//            self.data = newArray
//            self.collectionView.performBatchUpdates({
//                self.collectionView.insertItems(at: diffable.inserts)
//            }, completion: nil)
//        }
    }
}

extension TraditionalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if data[indexPath.row] is String {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelfSizingCell", for: indexPath) as! SelfSizingCell
            cell.text = data[indexPath.row] as! String
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmbeddedCollectionViewCell", for: indexPath) as! EmbeddedCollectionViewCell
            cell.number = data[indexPath.row] as! Int
            return cell
        }
    }
}

extension TraditionalViewController: UICollectionViewDelegate {
    
}

extension TraditionalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if data[indexPath.row] is String {
            return CGSize(width: collectionView.frame.width, height: 55)
        } else {
            return CGSize(width: collectionView.frame.width, height: 100)
        }
    }
}
