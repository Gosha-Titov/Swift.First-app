//
//  AllFriendsTableVC.swift
//  FirstApp
//
//  Created by Гоша on 22.12.2021.
//

import UIKit

final class AllPeopleTableVC: UITableViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "personCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return People.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as? PersonCell
        else { return UITableViewCell() }

        let person = People.all[indexPath.row]
        let condition = People.friends.contains {
            (friend: Person) -> Bool in
            return friend.id == person.id
        }
        
        cell.configurate(
            image: person.images.first ?? UIImage(),
            name: person.name,
            additionalTextIsNeeded: condition)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(withIdentifier: "addFriend", sender: nil)
    }
}
