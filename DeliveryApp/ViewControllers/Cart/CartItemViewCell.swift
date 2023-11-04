//
//  CartItemViewCell.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 04/11/2023.
//

import UIKit

final class CartItemViewCell: UITableViewCell {
    
    var actionAdd: (() -> Void)?
    var actionRemove: (() -> Void)?

    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCost: UILabel!

    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBAction func buttonMinusPressed() {
        actionRemove?()
    }
    
    @IBAction func buttonPlusPressed() {
        actionAdd?()
    }
    
}
