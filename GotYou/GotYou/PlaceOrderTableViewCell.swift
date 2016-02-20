//
//  PlaceOrderTableViewCell.swift
//  GotYou
//
//  Created by Steven Wang on 2/16/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class PlaceOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var numOrders: UILabel!
    @IBOutlet weak var expireDate: UILabel!
    @IBOutlet weak var friendPicture: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
