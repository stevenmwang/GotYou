//
//  AddModel.swift
//  GotYou
//
//  Created by Steven Wang on 2/18/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class AddModel: NSObject {
    var dataParams:NSDictionary = NSDictionary()
    
    init(dataParams:NSDictionary) {
        self.dataParams = dataParams
    }
    
    func postToPHP() {
        let eventDescription = dataParams["eventDescription"] as! String
        let location = dataParams["eventLocation"] as! String
        let orderLimit = dataParams["orderLimit"] as! String
        let eventDate = dataParams["eventDate"] as! String
        let userID = dataParams["userID"] as! String
        let postString = "userID=\(userID)&eventLocation=\(location)&expireDate=\(eventDate)&eventDescription=\(eventDescription)&orderLimit=\(orderLimit)"
        
        var url: NSURL = NSURL(string: "http://localhost/addEvent.php")!
        var request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        request.HTTPMethod = "POST"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
            {
                (response, data, error) in
                
        }
        
    }
    
}
