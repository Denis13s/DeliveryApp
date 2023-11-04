//
//  CartViewController.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 03.11.2023.
//

import UIKit

final class CartViewController: UIViewController {

    @IBOutlet weak var orderButton: UIButton!
    
    var cartProductList: [String: Int] = ["burger": 1, "pizza": 1]
    
    override func viewWillLayoutSubviews() {
        
        orderButton.layer.cornerRadius = orderButton.frame.height / 4
        
        orderButton.titleLabel?.text = "Order \(cartProductList.count) for 50$"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let orderVC = navigationVC.topViewController as? OrderViewController else { return }
        orderVC.orderProductList = cartProductList
    }
    
    @IBAction func deleteButtonPressed() {
        cartProductList.removeValue(forKey: <#T##String#>)
    }
    @IBAction func addButtonPressed() {
        
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartProduct", for: indexPath) as? CartTableViewCell
        
        let product = ""
        
        cell?.name.text = product
        cell?.composition.text = product
        cell?.quantity.text = product
        cell?.price.text = product
        cell?.photo.image = UIImage(systemName: "minus.circle.fill")
        
        return cell!
    }
}
