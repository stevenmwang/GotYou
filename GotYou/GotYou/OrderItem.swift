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
    var order: String
    var userID: String
    var eventID: String
    var quantity: Int
    var verified: Bool
    var price: Double
    
    init (orderID: String, order: String, userID: String, eventID: String,
        quantity: Int, verified: Bool, price: Double) {
            self.orderID = orderID
            self.order = order
            self.userID = userID
            self.eventID = eventID
            self.quantity = quantity
            self.verified = verified
            self.price = price
    }
}
