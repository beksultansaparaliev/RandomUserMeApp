//
//  ContactListViewController.swift
//  RandomUserMeApp
//
//  Created by Masaie on 16/4/22.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    let users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.user = sender as? User
    }
}

// MARK: - Table view data source
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        content.imageProperties.cornerRadius = 50
        
        let contact = users[indexPath.row]
        content.text = contact.name.first
        content.secondaryText = contact.name.last
        
        NetworkManager.shared.fetchData(from: contact.picture.thumbnail) { result in
            switch result {
            case .success(let imageData):
                content.image = UIImage(data: imageData)
                cell.contentConfiguration = content
            case .failure(let error):
                print(error)
            }
        }
        
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactListViewController {
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentContact = users[indexPath.row]
        performSegue(withIdentifier: "ShowContact", sender: currentContact)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
