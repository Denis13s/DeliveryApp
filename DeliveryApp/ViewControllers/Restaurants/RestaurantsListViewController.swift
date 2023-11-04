//
//  RestaurantsListViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import UIKit

final class RestaurantsListViewController: UITableViewController {
    
    var restaurants: [Restaurant]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let restaurantMenuVC = segue.destination as? RestaurantMenuViewController {
            if let restaurant = sender as? Restaurant {
                restaurantMenuVC.restaurant = restaurant
            }
        }
    }
    
}

// MARK: UITableViewDataSource
extension RestaurantsListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRestaurant", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = restaurants[indexPath.row].title
        cell.contentConfiguration = content
        
        return cell
    }
    
}

// MARK: UITableViewDelegate
extension RestaurantsListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showRestaurantMenu", sender: restaurants[indexPath.row])
    }
    
}
