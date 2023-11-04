//
//  RestaurantViewCell.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 04/11/2023.
//

import UIKit

final class RestaurantViewCell: UITableViewCell {
    
    @IBOutlet weak var imageRestaurant: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var imageDelivery: UIImageView!
    @IBOutlet weak var labelDeliveryPrice: UILabel!
    @IBOutlet weak var labelDeliveryTime: UILabel!
}
