//
//  CartTableViewCell.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 03.11.2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var composition: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func delete() {
        
    }
    
    @IBAction func add() {
        
    }
}
