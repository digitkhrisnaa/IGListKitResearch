//
//  IGListKitViewController.swift
//  IGLKitResearch
//
//  Created by Digital Khrisna on 23/04/18.
//  Copyright © 2018 Digital Khrisna. All rights reserved.
//

import IGListKit
import UIKit

class IGListKitViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
//        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    let data: [Any] = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non accumsan dui. Fusce scelerisque malesuada arcu, quis vulputate magna lacinia auctor. Mauris suscipit magna luctus mollis placerat. Praesent a tincidunt tortor, vitae elementum mauris. Quisque sed nibh quis metus suscipit egestas. Cras justo odio, venenatis eu sapien vitae, aliquet consequat sapien. Nam facilisis cursus finibus. Phasellus rutrum lacus ligula, eget faucibus dui venenatis nec. In feugiat nisl ac magna molestie fermentum. Aliquam erat volutpat. Nullam a suscipit sem. Mauris eu mattis nisl. Etiam vestibulum diam nulla, ac vulputate velit ultrices in. Phasellus molestie ornare diam vel pulvinar. Nulla dignissim sapien in justo laoreet, mattis vestibulum metus posuere. Aliquam elementum odio nec erat sollicitudin egestas. Aenean pulvinar, massa eu vulputate volutpat, magna leo eleifend nibh, quis tempus odio enim at erat. Maecenas mi justo, aliquam quis enim non, interdum luctus massa. Nulla congue magna et nunc ultrices, ut gravida tellus mattis. Vivamus augue leo, mollis a accumsan vel, sagittis sit amet leo. Aliquam id ex varius, vehicula mi at, euismod arcu. Phasellus bibendum eros turpis, ut porttitor risus cursus nec. Nulla facilisi. Etiam mattis odio massa. Fusce sed enim sit amet enim congue condimentum. In ut nunc commodo, molestie dui eu, interdum nibh. Nulla placerat suscipit lectus, a cursus neque ultrices in. Sed vitae tristique sem. Praesent euismod et ipsum a convallis. Etiam vel imperdiet nisi, eu facilisis augue. Etiam vel felis ",
        10,
        "Tellus Nibh Ipsum Inceptos",
        20,
    ]
    
    var additionalData: Int?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
            self.additionalData = 5
            self.adapter.performUpdates(animated: true, completion: nil)
//            self.adapter.reloadData(completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.bounds
    }
}

extension IGListKitViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        if let datas = additionalData {
            return [datas] + data as! [ListDiffable]
        }
        
        return data as! [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is Int {
            return CollectionViewSectionController()
        } else {
            return LabelSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
