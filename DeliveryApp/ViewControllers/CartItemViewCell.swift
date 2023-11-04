//
//  CartItemViewCell.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 04/11/2023.
//

import UIKit

class CartItemViewCell: UITableViewCell {

    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var lableDescription: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonMinusPressed() {
    }
    @IBAction func buttonPlusPressed() {
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
