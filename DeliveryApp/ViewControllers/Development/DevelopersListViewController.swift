//
//  DevelopersListViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 05/11/2023.
//

import UIKit

class DevelopersListViewController: UITableViewController {
    
    var developers: [Developer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
}

// MARK: UITableViewDataSource
extension DevelopersListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDeveloper", for: indexPath) as! DeveloperViewCell
        
        let developer = developers[indexPath.row]
        
        cell.imageDeveloper.image = UIImage(named: developer.image)
        cell.imageDeveloper.contentMode = .scaleAspectFill
        cell.imageDeveloper.layer.cornerRadius = 15
        
        cell.labelFullName.text = developer.fullName

        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: UITableViewDelegate
extension DevelopersListViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}

