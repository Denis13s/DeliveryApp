//
//  CartListViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 04/11/2023.
//

import UIKit

class CartListViewController: UITableViewController {
    
    var cartManager: CartManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        printMessage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartManager = CartManager.shared
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(String(cartManager.cart.count))
        return cartManager.cart.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCartItem", for: indexPath) as! CartItemViewCell
        
        let cartItem = cartManager.cart[indexPath.row]
        let menuItem = cartItem.item
        
        cell.labelAmount.text = "\(cartItem.amount)x"
        print("\(cartItem.amount)x")
        cell.imageItem.image = UIImage(named: menuItem.image)
        cell.imageItem.contentMode = .scaleAspectFill
        cell.imageItem.layer.cornerRadius = 5
        cell.labelTitle.text = menuItem.title
        cell.lableDescription.text = menuItem.description
        cell.labelPrice.text = menuItem.price
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension CartListViewController {
//
//    
//    
//    // Вызывается перед появлением вью
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        printMessage()
//    }
//    
//    
//    // Вызывается автоматически системой Auto Layout, когда необходимо обновить ограничения в представлении
//    override func updateViewConstraints() {
//        printMessage()
//        super.updateViewConstraints()
//    }
//    
//    // Вызывается перед расстановкой subviews
//    override func viewWillLayoutSubviews() {
//        printMessage()
//    }
//    
//    // Тут срабатывает Auto Layout
//    
//    
//    // Вызывается после расстановки subviews
//    override func viewDidLayoutSubviews() {
//        printMessage()
//    }
//    
//    // Вызывается после появления вью на экране
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        printMessage()
//    }
//    

//}

private extension CartListViewController {
        func printMessage(function: String = #function) {
            print("\(title ?? ""): \(function)")
        }
}
