//
//  AllGroupsTableViewController.swift
//  FirstApp
//
//  Created by Гоша on 20.12.2021.
//

import UIKit

class AllGroupsTableVC: UITableViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Groups.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        else { return UITableViewCell() }

        let group = Groups.all[indexPath.row]
        let condition = Groups.mine.contains {
            (myGroup: Group) -> Bool in
            return myGroup.id == group.id
        }
        
        cell.configurate(
            image: group.image,
            name: group.name,
            additionalTextIsNeeded: condition)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
}
