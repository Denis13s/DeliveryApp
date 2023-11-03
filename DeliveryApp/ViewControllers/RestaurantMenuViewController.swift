//
//  RestaurantMenuViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import UIKit

final class RestaurantMenuViewController: UIViewController {

    @IBOutlet weak var imageRestaurant: UIImageView!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    


}

private extension RestaurantMenuViewController {
    
    func setUI() {
        imageRestaurant.clipsToBounds = true
        imageRestaurant.contentMode = .scaleAspectFit
        imageRestaurant.layer.cornerRadius = 15
        imageRestaurant.image = UIImage(named: restaurant.image)
    }
    
}
