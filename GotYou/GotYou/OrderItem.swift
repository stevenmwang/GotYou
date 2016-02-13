//
//  OrderClass.swift
//  GotYou
//
//  Created by Steven Wang on 2/13/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class OrderClass: NSObject {
    var orderID: String
    var userID: Int
    var eventID: Int
    var quantity: Int
    var cost: Double
    
    init (orderID: String, userID: Int, eventID: Int,
        quantity: Int, cost: Double) {
            self.orderID = orderID
            self.userID = userID
            self.eventID = eventID
            self.quantity = quantity
            self.cost = cost
    }
}
