//
//  Menu.swift
//  GotYou
//
//  Created by Steven Wang on 2/24/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class Menu: NSObject {
    var menu:NSMutableArray = NSMutableArray()
    var menuName:String
    
    init(menuName:String) {
        self.menuName = menuName
    }
    
    func addSection(section: MenuSection) {
        menu.addObject(section)
    }
}
