//
//  FriendProfileCollectionVC.swift
//  FirstApp
//
//  Created by Гоша on 20.12.2021.
//

import UIKit

class FriendProfileCollectionVC: UICollectionViewController {
    var images = [UIImage]()
    var name = String()
    var avatar = UIImage()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.register(
            UINib(nibName: "FriendProfileCell", bundle: nil),
            forCellWithReuseIdentifier: "friendProfileCell"
        )
        
//        self.collectionView?.register(
//            UINib(nibName: "FriendMainView", bundle: nil),
//            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//            withReuseIdentifier: "friendMainView"
//        )
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "friendProfileCell",
                for: indexPath) as? FriendProfileCell
                
        else { return UICollectionViewCell() }
        
        cell.configurate(image: images[indexPath.item] ?? UIImage())
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader,
              let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "friendMainView", for: indexPath) as? FriendMainView
        else { return UICollectionReusableView() }
        
        reusableView.configurate(image: avatar, name: name)
  
        return reusableView
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: view.frame.width, height: 250)
    }
}

