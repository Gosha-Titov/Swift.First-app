//
//  PersonPostCell.swift
//  FirstApp
//
//  Created by Гоша on 23.12.2021.
//

import UIKit

class PersonPostCell: UICollectionViewCell {
    static let identifier = "personPostCell"
    static let nib = UINib(nibName: "PersonPostCell", bundle: nil)
    
    @IBOutlet weak var post: UIImageView!
    
    func configurate(image: UIImage) -> Void {
        post.image = image
        post.layer.cornerRadius = 3
    }
}
