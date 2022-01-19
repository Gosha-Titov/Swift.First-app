//
//  Person.swift
//  FirstApp
//
//  Created by Гоша on 22.12.2021.
//

import UIKit

struct Person {
    private static var count: Int = 0
    
    let name: String
    let images: [UIImage]
    let id: Int
    
    init(name: String, images: [UIImage]) {
        self.name = name
        self.images = images
        
        id = Person.count
        Person.count += 1
    }
}

class People {
    static var all = [Person]()
    static var friends = [Person]()
}
