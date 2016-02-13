//
//  EventTableViewCell.swift
//  GotYou
//
//  Created by Steven Wang on 2/10/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var eventDesc: UILabel!

    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var numOrders: UILabel!
    @IBOutlet weak var maxOrders: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
