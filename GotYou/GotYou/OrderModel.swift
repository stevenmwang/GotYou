//
//  EventModel.swift
//  GotYou
//
//  Created by Steven Wang on 2/10/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation

protocol OrderModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}

class OrderModel: NSObject, NSURLSessionDelegate {
    var urlPathDisplayAllOrders:String = "http://localhost/displayAllOrders.php?eventID="
    var urlPathDisplayYourOrders:String = "http://localhost/displayYourOrders.php?userID="
    weak var delegate: EventModelProtocal!
    var data : NSMutableData = NSMutableData()
    var userID = ""
    var eventID = ""
    
    init(eventID: String) {
        self.eventID = eventID
    }
    
    init(userID: String, eventID: String) {
        self.userID = userID
        self.eventID = eventID
    }
    
    func getJSON(whichPHP: String) {
        var urlPath:String = ""
        switch whichPHP {
        case "displayAllOrders" :
            urlPath = urlPathDisplayAllOrders + String(eventID)
        case "displayYourOrders" :
            urlPath = urlPathDisplayYourOrders + String(userID) + "&eventID=" + String(eventID)
        default :
            break;
            
        }
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithURL(url)
        
        task.resume()
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data);
        
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(self.data, options:NSJSONReadingOptions.AllowFragments) as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let orders: NSMutableArray = NSMutableArray()
        
        for(var i = 0; i < jsonResult.count; i++)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let orderID = jsonElement["id"] as? String,
                let eventID = jsonElement["eventID"] as? String,
                let userID = jsonElement["userID"] as? String,
                let order = jsonElement["order"] as? String,
                let price = Double((jsonElement["price"] as? String)!),
                let quantity = Int((jsonElement["quantity"] as? String)!) {
                    
                    let verified = (jsonElement["verified"] as? NSString)?.boolValue
                    let event = OrderClass(orderID:orderID, order: order, userID:userID, eventID: eventID, quantity:quantity, verified: verified!, price: price)
                    orders.addObject(event)

            }
            
            
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(orders)
            
        })
    }
    
    
    
}
