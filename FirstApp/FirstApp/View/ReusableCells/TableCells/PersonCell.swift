//
//  PersonCell.swift
//  FirstApp
//
//  Created by Гоша on 21.12.2021.
//

import UIKit

extension UIImageView {
   func setRounded() {
       let radius = self.frame.width / 2
       self.layer.cornerRadius = radius
       self.layer.masksToBounds = true
   }
}

class PersonCell: UITableViewCell {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var additionalLabel: UILabel!
    
    func configurate(image: UIImage, name: String, additionalTextIsNeeded: Bool) -> Void {
        personImage.image = image
        personImage.setRounded()
        personName.text = name
        if additionalTextIsNeeded {
            additionalLabel.text = "Friend"
        } else {
            additionalLabel.text = ""
        }
    }
}
