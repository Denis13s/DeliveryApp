//
//  RestaurantMenuViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import UIKit

final class RestaurantMenuViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    var restaurant: Restaurant!
    let cartManager = CartManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

private extension RestaurantMenuViewController {
    
    func setUI() {
        title = restaurant.title
    }
    
}

// MARK: UITableViewDataSource
extension RestaurantMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurant.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenuItem", for: indexPath) as! MenuItemViewCell
        let menuItem = restaurant.menuItems[indexPath.row]
        
        cell.imageItem.image = UIImage(named: menuItem.image)
        cell.imageItem.contentMode = .scaleAspectFill
        cell.imageItem.layer.cornerRadius = 15
        cell.labelTitle.text = menuItem.title
        cell.labelDescription.text = menuItem.description
        cell.labelPrice.text = "$\(menuItem.price)"
//        cell.buttonAdd.isHidden = true
//        cell.buttonAdd.layer.cornerRadius = 10
//        cell.actionAdd = { [weak self] in
//            self?.cartManager.addItem(menuItem)
//        }
        
//        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear

        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 375, height: 170))
        imageView.image = UIImage(named: restaurant.image)

        headerView.addSubview(imageView)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        185
    }
    
}

// MARK: UITableViewDelegate
extension RestaurantMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = restaurant.menuItems[indexPath.row]
        cartManager.addItem(menuItem)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
