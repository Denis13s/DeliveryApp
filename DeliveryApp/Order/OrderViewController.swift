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
        labelDeliveryTime.text = "45-60 min"
        labelCostProducts.text = "$\(String(format: "%.2f", cost))"
        labelCostDelivery.text = "$2.99"
        labelCostServices.text = "$0.99"
        labelCostTotal.text = "$\(String(format: "%.2f", (cost + 2.99 + 0.99)))"
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
