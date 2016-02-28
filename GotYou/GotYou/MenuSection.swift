//
//  MenuSection.swift
//  GotYou
//
//  Created by Steven Wang on 2/24/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class MenuSection: NSObject {
    var items: NSMutableArray = NSMutableArray()
    var name: String
    
    init(name:String) {
        self.name = name
    }
    
    func addItem(item:MenuItem) {
        items.addObject(item)
    }
    
    
}
