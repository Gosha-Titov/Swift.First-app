//
//  UserProfileViewController.swift
//  FirstApp
//
//  Created by Гоша on 20.12.2021.
//

import UIKit

class UserProfileVC: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.image = UIImage(named: "profile")
        avatar.setRounded()
    }
}
