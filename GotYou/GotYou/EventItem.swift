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
    var endDate: NSDate
    var eventDescription: String
    var cost: NSInteger
    var numOrders: NSInteger
    
    init(location: String, startDate: NSDate, endDate: NSDate, eventDesc: String) {
        self.eventLocation = location
        self.startDate = startDate
        self.endDate = endDate
        self.eventDescription = eventDesc
        self.cost = 0
        self.numOrders = 0
    }
    
}
