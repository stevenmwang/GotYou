//
//  EventItem.swift
//  GotYou
//
//  Created by Steven Wang on 2/9/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class EventItem: NSObject {
    var eventLocation: String
    var startDate: NSDate
    var duration: Int
    var eventDescription: String
    var cost: Int
    var numOrders: Int
    
    init(location: String, startDate: NSDate, duration: Int, eventDesc: String, cost: Int, numOrders: Int) {
        self.eventLocation = location
        self.startDate = startDate
        self.duration = duration
        self.eventDescription = eventDesc
        self.cost = cost
        self.numOrders = numOrders
    }
    
}
