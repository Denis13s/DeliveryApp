//
//  CartTableViewCell.swift
//  DeliveryApp
//
//  Created by Kirill Syrtsev on 03.11.2023.
//

import UIKit

final class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var composition: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func delete() {
    
    }
    
    @IBAction func add() {
        
    }
}
