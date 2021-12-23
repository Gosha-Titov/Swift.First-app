//
//  FriendMainCell.swift
//  FirstApp
//
//  Created by Гоша on 23.12.2021.
//

import UIKit

class FriendMainCell: UICollectionViewCell {

    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    func configurate(image: UIImage, name: String) -> Void {
        friendAvatar.image = image
        friendName.text = name
    }
}
