//
//  CartViewController.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 03.11.2023.
//

import UIKit

final class CartViewController: UIViewController {

    @IBOutlet weak var orderButton: UIButton!
    
    var cartProductList: [String] = []
    
    override func viewWillLayoutSubviews() {
        
        orderButton.layer.cornerRadius = orderButton.frame.height / 4
        
        orderButton.titleLabel?.text = "Order 10 for 50$"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let orderVC = navigationVC.topViewController as? OrderViewController else { return }
        orderVC.orderProductList = cartProductList
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        cartProductList = []
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        cartProductList.count
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartProduct", for: indexPath) as! CartTableViewCell
        
//        let product = cartProductList[indexPath.row]
        
        cell.name.text = "Burger"
        cell.composition.text = "Bread"
        cell.quantity.text = "x1"
        cell.price.text = "5$"
        cell.photo.image = UIImage(systemName: "minus.circle.fill")
        
        return cell
    }
}
