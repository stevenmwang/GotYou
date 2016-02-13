//
//  EventItem.swift
//  GotYou
//
//  Created by Steven Wang on 2/9/16.
//  *BRANCH AZHANG
//  Updated today
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit
class EventItem: NSObject {
    var eventID: Int
    var userID: Double
    var eventLocation: String
    var expireDate: NSDate
    var eventDescription: String
    var numOrders: Int
    var orderLimit: Int
    
    init (eventID: Int, userID: Double, eventLocation: String, expireDate: NSDate,
        eventDescription: String, numOrders: Int, orderLimit: Int) {
            self.eventID = eventID
            self.userID = userID
            self.eventLocation = eventLocation
            self.expireDate = expireDate
            self.eventDescription = eventDescription
            self.numOrders = numOrders
            self.orderLimit = orderLimit
            
    }
}