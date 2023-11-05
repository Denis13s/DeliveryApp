//
//  ApplePayViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 05/11/2023.
//

import UIKit

final class ApplePayViewController: UIViewController {

    @IBOutlet weak var imageApplePay: UIImageView!
    @IBOutlet weak var buttonConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @IBAction func buttonConfirmPressed() {
        showAlert(with: "Payment succeed!")
    }
}

private extension ApplePayViewController {
    
    func setUI() {
        imageApplePay.image = UIImage(named: "applePay")
        imageApplePay.contentMode = .scaleAspectFill
        imageApplePay.layer.cornerRadius = 15
        buttonConfirm.layer.cornerRadius = 15
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "showDelivery", sender: nil)
        }
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
}
