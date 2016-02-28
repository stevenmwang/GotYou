//
//  MenuItem.swift
//  GotYou
//
//  Created by Steven Wang on 2/24/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class MenuItem: NSObject {
    var menuPrice:Double
    var menuName:String
    var menuDescription:String
    
    init(price: Double, name: String, description: String) {
        self.menuPrice = price
        self.menuName = name
        self.menuDescription = description
    }
    
}
