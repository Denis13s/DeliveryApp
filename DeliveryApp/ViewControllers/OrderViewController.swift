//
//  OrderViewController.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 03.11.2023.
//

import UIKit

final class OrderViewController: UIViewController {
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var deliveryPrice: UILabel!
    @IBOutlet weak var servicesPrice: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    var orderProductList: [String] = []

    private var delivery: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productPrice.text = "\(getProductPrice())$"
        deliveryPrice.text = "\(getDeliveryPrice())$"
        servicesPrice.text = "\(getServicePrice())$"
        totalPrice.text = "\(getTotalPrice())$"
    }
    
    override func viewWillLayoutSubviews() {
        orderButton.layer.cornerRadius = orderButton.frame.height / 4
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        orderProductList.count
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderTableViewCell
        
//        let product = orderProductList[indexPath.row]
        
        cell.quantity.text = "x1"
        cell.name.text = "Burger"
        cell.composition.text = "Bread"
        cell.price.text = "5$"
        
        return cell
    }
    
    func getProductPrice() -> Int {
//        var productPrice = 0
//        for product in orderProductList {
//            productPrice += product.price
//        }
        return 100
    }
    
    func getDeliveryPrice() -> Int {
        delivery = Int.random(in: 10...100)
        return delivery
    }
    
    func getServicePrice() -> Int {
        let service = getProductPrice() / 10
        return service
    }
    
    func getTotalPrice() -> Int{
        let total = getProductPrice() + delivery + getServicePrice()
        return total
    }
}
