//
//  GroupCell.swift
//  FirstApp
//
//  Created by Гоша on 23.12.2021.
//

import UIKit

class GroupCell: UITableViewCell {
    static let identifier = "groupCell"
    static let nib = UINib(nibName: "GroupCell", bundle: nil)
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var additionalText: UILabel!
    
    func configurate(image: UIImage, name: String, additionalTextIsNeeded: Bool) -> Void {
        groupImage.image = image
        groupImage.layer.cornerRadius = 5
        groupName.text = name
        
        if additionalTextIsNeeded {
            additionalText.text = "You're in a group"
        } else {
            additionalText.text = ""
        }
    }
    
}
