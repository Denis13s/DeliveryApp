//
//  CartViewController.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 03.11.2023.
//

import UIKit

final class CartViewController: UIViewController {

    @IBOutlet weak var orderButton: UIButton!
    
    var productList: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        orderButton.layer.cornerRadius = orderButton.frame.height / 4
        
        orderButton.titleLabel?.text = "Order \(productList.count) for 50$"
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartProduct", for: indexPath) as! CartTableViewCell
        
        let product = productList[indexPath.row]
        
        cell.name.text = "Burger"
        cell.composition.text = "Bread"
        cell.quantity.text = "x1"
        cell.price.text = "5$"
        cell.photo.image = UIImage(systemName: "minus.circle.fill")
        
        return cell
    }
}
