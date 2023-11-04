//
//  MenuItemViewCell.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 04/11/2023.
//

import UIKit

final class MenuItemViewCell: UITableViewCell {
    
    var actionAdd: (() -> Void)?

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var buttonAdd: UIButton!
    
    @IBAction func buttonPlusPressed() {
        actionAdd?()
    }
    
}
