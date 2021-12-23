//
//  FriendProfileCell.swift
//  FirstApp
//
//  Created by Гоша on 23.12.2021.
//

import UIKit

class FriendProfileCell: UICollectionViewCell {
    @IBOutlet weak var friendImage: UIImageView!
    
    func configurate(image: UIImage) -> Void {
        friendImage.image = image
        friendImage.layer.cornerRadius = 3
    }
}
