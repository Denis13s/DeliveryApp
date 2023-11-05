//
//  DeliveryViewController.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 04.11.2023.
//

import UIKit

final class DeliveryViewController: UIViewController {

    @IBOutlet weak var deliveryImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deliveryImage.image = UIImage(systemName: "figure.outdoor.cycle")
    }

}
