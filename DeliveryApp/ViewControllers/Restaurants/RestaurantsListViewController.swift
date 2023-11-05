//
//  RestaurantsListViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import UIKit

final class RestaurantsListViewController: UITableViewController {
    
    var restaurants: [Restaurant]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
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
        restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRestaurant", for: indexPath) as! RestaurantViewCell
        
        let restaurant = restaurants[indexPath.row]
        
        cell.imageRestaurant.image = UIImage(named: restaurant.image)
        cell.imageRestaurant.contentMode = .scaleAspectFill
        cell.imageRestaurant.layer.cornerRadius = 15
        cell.labelTitle.text = restaurant.title
        cell.labelCategory.text = restaurant.categoryTitle
        
        // TODO: Make dynamic
        cell.imageDelivery.image = UIImage(systemName: "bicycle")
        cell.labelDeliveryPrice.text = "$\(restaurant.deliveryFee)"
        cell.labelDeliveryTime.text = restaurant.deliveryTime
        
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: UITableViewDelegate
extension RestaurantsListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showRestaurantMenu", sender: restaurants[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
    
}
