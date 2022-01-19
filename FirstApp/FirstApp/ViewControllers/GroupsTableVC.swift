//
//  GroupsTableViewController.swift
//  FirstApp
//
//  Created by Гоша on 20.12.2021.
//

import UIKit

final class GroupsTableVC: UITableViewController {

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard segue.identifier == "addGroup",
              let allGroupsController = segue.source as? AllGroupsTableVC,
              let indexPath = allGroupsController.tableView.indexPathForSelectedRow
        else { return }
        let group = Groups.all[indexPath.row]
        
        let groupIsAlreadyMine = Groups.mine.contains {
            (newGroup: Group) -> Bool in
            return newGroup.id == group.id
        }
        
        if groupIsAlreadyMine == false {
            Groups.mine.append(group)
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            GroupCell.nib,
            forCellReuseIdentifier: GroupCell.identifier
        )
        
        loadGroups()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Groups.mine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: GroupCell.identifier,
                for: indexPath
            ) as? GroupCell
        else { return UITableViewCell() }

        let group = Groups.mine[indexPath.row]
        
        cell.configurate(
            image: group.image,
            name: group.name,
            additionalTextIsNeeded: false)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Groups.mine.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - private methods
    
    private func loadGroups() -> Void {
        var groups = [Group]()
        let names = ["Netflix", "The Witcher"]

        var groupsImages = [UIImage]()
        for i in 0..<names.count {
            let image = UIImage(named: "g.\(i)") ?? UIImage()
            groupsImages.append(image)
        }

        for (name, image) in zip(names, groupsImages) {
            let group = Group(name: name, image: image)
            groups.append(group)
        }
        
        Groups.all = groups
        Groups.mine = Array(arrayLiteral: groups[0])
    }
}
