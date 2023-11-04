//
//  RestaurantMenuViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import UIKit

final class RestaurantMenuViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageRestaurant: UIImageView!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    


}

private extension RestaurantMenuViewController {
    
    func setUI() {
        imageRestaurant.image = UIImage(named: restaurant.image)
        imageRestaurant.contentMode = .scaleAspectFill
        imageRestaurant.layer.cornerRadius = 15

        title = restaurant.title
    }
    
}

extension RestaurantMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurant.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenuItem", for: indexPath) as! MenuItemViewCell
//        var content = cell.defaultContentConfiguration()
//        content.text = restaurant.menuItems[indexPath.row].title
//        content.secondaryText = restaurant.menuItems[indexPath.row].description
//        cell.contentConfiguration = content
        let menuItem = restaurant.menuItems[indexPath.row]
        
        cell.imageItem.image = UIImage(named: menuItem.image)
        cell.imageItem.contentMode = .scaleAspectFill
        cell.imageItem.layer.cornerRadius = 15
        cell.labelTitle.text = menuItem.title
        cell.labelDescription.text = menuItem.description
        cell.labelPrice.text = menuItem.price
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}
