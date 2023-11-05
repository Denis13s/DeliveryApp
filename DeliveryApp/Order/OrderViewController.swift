//
//  OrderViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 05/11/2023.
//

import UIKit

final class OrderViewController: UIViewController {
    
    @IBOutlet weak var labelItems: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewDelivery: UIView!
    @IBOutlet weak var labelDeliveryTime: UILabel!
    
    @IBOutlet weak var labelCostProducts: UILabel!
    @IBOutlet weak var labelCostDelivery: UILabel!
    @IBOutlet weak var labelCostServices: UILabel!
    @IBOutlet weak var labelCostTotal: UILabel!
    
    @IBOutlet weak var buttonOrderAndPay: UIButton!
    
    let dataService = DataService.shared
    var cartManager: CartManager!
    var amount: Int!
    var cost: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBAction func buttonXPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func buttonOrderPressed() {
        performSegue(withIdentifier: "showApplePay", sender: nil)
    }
    
}

private extension OrderViewController {
    
    func setUI() {
        labelItems.text = "Overall \(String(amount)) items for $\(String(format: "%.2f", cost))"
        viewDelivery.layer.cornerRadius = 5
        buttonOrderAndPay.layer.cornerRadius = 15
        
        // TODO: Make Dynamic
        setDeliveries()
        labelCostProducts.text = "$\(String(format: "%.2f", cost))"
        labelCostServices.text = "$0.99"
        
    }
    
    func setDeliveries() {
        var restaurants = [Restaurant]()
        
        cartManager.cart.forEach { cartItem in
            let restaurant = dataService.restaurants.first(where: { $0.title == cartItem.item.restaurantTitle } )
            if !restaurants.contains(where: { $0.title == restaurant?.title } ) {
                if let restaurant {
                    restaurants.append(restaurant)
                }
            }
        }
        
        labelDeliveryTime.text = (restaurants.count > 1) ? "90+ min" : restaurants.first?.deliveryTime ?? ""
        var deliveryFee = 0.0
        restaurants.forEach { deliveryFee += $0.deliveryFee }
        labelCostDelivery.text = "$\(String(format: "%.2f", deliveryFee))"
        labelCostTotal.text = "$\(String(format: "%.2f", (cost + deliveryFee + 0.99)))"
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// MARK: UITableViewDataSource
extension OrderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartManager.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOrderItem", for: indexPath) as! OrderItemViewCell
        
        let cartItem = cartManager.cart[indexPath.row]
        let menuItem = cartItem.item
        
        cell.labelAmount.text = "\(cartItem.amount)x"
        cell.labelTitle.text = menuItem.title
        cell.labelDescription.text = menuItem.description
        cell.labelCost.text = "$\(String(format: "%.2f", cartItem.cost))"
        
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: UITableViewDelegate
extension OrderViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
}
