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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")
        loadGroups()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Groups.mine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
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
            groups.append( Group(name: name, image: image) )
        }
        
        Groups.all = groups
        Groups.mine = Array(arrayLiteral: groups[0])
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
