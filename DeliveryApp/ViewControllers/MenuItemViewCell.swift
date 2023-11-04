//
//  MenuItemViewCell.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 04/11/2023.
//

import UIKit

class MenuItemViewCell: UITableViewCell {

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var buttonAdd: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
