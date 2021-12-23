//
//  ProfileViewController.swift
//  FirstApp
//
//  Created by Гоша on 20.12.2021.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImage.image = UIImage(named: "profile")
        mainImage.setRounded()
    }
}
