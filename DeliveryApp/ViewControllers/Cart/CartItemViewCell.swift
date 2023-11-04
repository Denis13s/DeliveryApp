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
    @IBOutlet weak var lableDescription: UILabel!
    @IBOutlet weak var labelCost: UILabel!

    @IBAction func buttonMinusPressed() {
        actionRemove?()
    }
    
    @IBAction func buttonPlusPressed() {
        actionAdd?()
    }
    
}
