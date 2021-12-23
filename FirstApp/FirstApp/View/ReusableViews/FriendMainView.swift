//
//  FriendMainView.swift
//  FirstApp
//
//  Created by Гоша on 23.12.2021.
//

import UIKit

class FriendMainView: UICollectionReusableView {

    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    func configurate(image: UIImage, name: String) {
        friendAvatar.image = image
        friendName.text = name
        
        friendAvatar.layer.cornerRadius = 10
    }
}
