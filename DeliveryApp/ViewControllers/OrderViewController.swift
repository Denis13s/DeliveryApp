//
//  OrderViewController.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 03.11.2023.
//

import UIKit

final class OrderViewController: UIViewController {
    
    @IBOutlet weak var orderButton: UIButton!
    
    var orderProductList: [String: Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        orderProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as? OrderTableViewCell
        
        let product = ""
        
        cell?.quantity.text = product
        cell?.name.text = product
        cell?.composition.text = product
        cell?.price.text = product
        
        return cell!
    }
    
    
}
