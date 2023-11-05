//
//  CartViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 04/11/2023.
//

import UIKit

final class CartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonOrder: UIButton!
    
    var cartManager: CartManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        setButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let orderVC = segue.destination as? OrderViewController {
            orderVC.cartManager = cartManager
            let amountAndCost = getAmountAndCost()
            orderVC.amount = amountAndCost.amount
            orderVC.cost = amountAndCost.cost
        }
    }
    
    @IBAction func buttonPressed() {
        performSegue(withIdentifier: "showOrder", sender: nil)
    }
    
}

private extension CartViewController {
    
    func setUI() {
        buttonOrder.layer.cornerRadius = 15
        setButton()
    }
    
    func setButton() {
        let amountAndCost = getAmountAndCost()
        buttonOrder.setTitle("Order \(amountAndCost.amount) for $\(String(format: "%.2f", amountAndCost.cost))", for: .normal)
        
        if cartManager.cart.isEmpty {
            buttonOrder.isHidden = true
        } else {
            buttonOrder.isHidden = false
        }
    }
    
    func getAmountAndCost() -> (amount: Int, cost: Double) {
        var amount = 0
        var cost = 0.0
        
        cartManager.cart.forEach { cartItem in
            amount += cartItem.amount
            cost += cartItem.cost
        }
        
        return (amount: amount, cost: cost)
    }
}


// MARK: UITableViewDataSource
extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartManager.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCartItem", for: indexPath) as! CartItemViewCell
        
        let cartItem = cartManager.cart[indexPath.row]
        let menuItem = cartItem.item
        
        cell.labelAmount.text = "\(cartItem.amount)x"
        cell.imageItem.image = UIImage(named: menuItem.image)
        cell.imageItem.contentMode = .scaleAspectFill
        cell.imageItem.layer.cornerRadius = 5
        cell.labelTitle.text = menuItem.title
        cell.labelDescription.text = menuItem.description
        cell.labelCost.text = "$\(String(format: "%.2f", cartItem.cost))"
        for button in [cell.buttonMinus, cell.buttonPlus] {
            button?.layer.cornerRadius = 10
        }
        
        cell.actionAdd = { [weak self] in
            self?.cartManager.addItem(menuItem)
            self?.tableView.reloadData()
            self?.setUI()
        }
        cell.actionRemove = { [weak self] in
            self?.cartManager.removeItem(menuItem)
            self?.tableView.reloadData()
            self?.setButton()
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: UITableViewDelegate
extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
