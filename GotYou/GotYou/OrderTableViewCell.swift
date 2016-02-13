//
//  OrderTableViewCell.swift
//  GotYou
//
//  Created by Steven Wang on 2/13/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var eventID: UILabel!
    @IBOutlet weak var userID: UILabel!
    
    @IBOutlet weak var order: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var verified: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

