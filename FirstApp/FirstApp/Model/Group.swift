//
//  Group.swift
//  FirstApp
//
//  Created by Гоша on 23.12.2021.
//

import UIKit

struct Group {
    private static var count: Int = 0
    
    let name: String
    let image: UIImage
    let id: Int
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
        
        id = Group.count
        Group.count += 1
    }
}

class Groups {
    static var all = [Group]()
    static var mine = [Group]()
}
