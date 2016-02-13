//
//  TabBarController.swift
//  GotYou
//
//  Created by Steven Wang on 2/13/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var userID:String = ""
    
    override func viewDidLoad() {
        let tableViewNav: UINavigationController = viewControllers![0] as! UINavigationController
        let tableView = tableViewNav.viewControllers[0] as! EventTableViewController
        tableView.userID = userID
    }
    
}
