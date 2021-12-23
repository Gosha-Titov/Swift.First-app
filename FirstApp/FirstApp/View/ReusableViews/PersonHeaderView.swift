//
//  PersonHeaderView.swift
//  FirstApp
//
//  Created by Гоша on 23.12.2021.
//

import UIKit

class PersonHeaderView: UICollectionReusableView {
    static let identifier = "personHeaderView"

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    func configurate(avatar: UIImage, name: String) {
        self.avatar.image = avatar
        self.name.text = name
        
        self.avatar.layer.cornerRadius = 10
    }
}
