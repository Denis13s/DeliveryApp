//
//  CategoriesListViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import UIKit

final class CategoriesListViewController: UITableViewController {
    
    var categories: [Category]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let restaurantsListVC = segue.destination as? RestaurantsListViewController {
            if let restaurants = sender as? [Restaurant] {
                restaurantsListVC.restaurants = restaurants
            }
        }
    }
}

// MARK: UITableViewDataSource
extension CategoriesListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategory", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = categories[indexPath.row].title
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: UITableViewDelegate
extension CategoriesListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCategoryRestaurants", sender: categories[indexPath.row].restaurants)
    }
    
}
