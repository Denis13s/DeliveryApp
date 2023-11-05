//
//  applePayViewController.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 04.11.2023.
//

import UIKit

final class ApplePayViewController: UIViewController {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = confirmButton.frame.height / 4
        cardImage.image = UIImage(systemName: "creditcard")
        cardImage.layer.cornerRadius = cardImage.frame.height / 4
    }
    
    @IBAction func cencelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
//    @IBAction func confirmButtonPressed() {
//        showAlert(with: "Payment was successfull", and: "Wait for your order")
//    }
}

//MARK: - UIAlertController
extension ApplePayViewController {
    private func showAlert(
        with title: String,
        and messege: String
    ) {
        let alert = UIAlertController(
            title: title,
            message: messege,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) //{ _ in
//            let deliveryVC = DeliveryViewController()
//            if let deliveryy = self.storyboard?.instantiateViewController(identifier: "delivery") {
//                self.navigationController?.pushViewController(deliveryVC, animated: true)
//            }
//        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
