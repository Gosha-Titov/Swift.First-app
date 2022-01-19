//
//  FriendsTableViewController.swift
//  FirstApp
//
//  Created by Гоша on 20.12.2021.
//

import UIKit

final class FriendsTableVC: UITableViewController {
    
    @IBAction func addFriend(segue: UIStoryboardSegue) {
        guard segue.identifier == "addFriend",
              let allPeopleController = segue.source as? AllPeopleTableVC,
              let indexPath = allPeopleController.tableView.indexPathForSelectedRow
        else { return }
        let person = People.all[indexPath.row]
        
        let personIsAlreadyFriend = People.friends.contains {
            (friend: Person) -> Bool in
            return friend.id == person.id
        }
        
        if personIsAlreadyFriend == false {
            People.friends.append(person)
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            PersonCell.nib,
            forCellReuseIdentifier: PersonCell.identifier
        )
        
        loadPeople()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return People.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PersonCell.identifier,
                for: indexPath
            ) as? PersonCell
        else { return UITableViewCell() }

        let friend = People.friends[indexPath.row]
        
        cell.configurate(
            image: friend.images.first ?? UIImage(),
            name: friend.name,
            additionalTextIsNeeded: false
        )

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(withIdentifier: "showFriendProfile", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            People.friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destinationVC = segue.destination as? PersonProfileCollectionVC
        else { return }
        
        switch segue.identifier {
        case "showFriendProfile":
            guard let indexPath = tableView.indexPathForSelectedRow
            else { break }
            let friend = People.friends[indexPath.row]
            destinationVC.avatar = friend.images.first!
            destinationVC.name = friend.name
            destinationVC.images = Array(friend.images[1...])
        default:
            break
        }
    }
    
    // MARK: - Private methods
    
    private func loadPeople() -> Void {
        var people = [Person]()
        let names = ["Geralt of Rivia", "Ciri of Cintra", "Yennefer", "Jaskier", "Roach", "Nivellen"]

        var peopleImages = [[UIImage]]()
        for i in 0..<names.count {
            peopleImages.append([])
            for j in 0... {
                guard let image = UIImage.init(named: "\(i).\(j)") else { break }
                peopleImages[i].append(image)
            }
        }

        for (name, images) in zip(names, peopleImages) {
            let person = Person(name: name, images: images)
            people.append(person)
        }
        
        People.all = people
        People.friends = Array(people[0...1])
    }
}
