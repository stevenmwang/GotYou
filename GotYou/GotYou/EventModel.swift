//
//  EventModel.swift
//  GotYou
//
//  Created by Steven Wang on 2/10/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import Foundation

protocol EventModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}

class EventModel: NSObject, NSURLSessionDelegate {
    var urlPathTableIndex:String = "http://localhost/indexEvents.php?userID="
    var urlPathDisplayAllOrders:String = "http://localhost/displayAllOrders.php?eventID="
    var urlPathDisplayYourOrders:String = "http://localhost/displayYourOrders.php?userID="
    var urlPathGetFriendEvents:String = "http://localhost/getFriendEvents.php?friends="
    
    weak var delegate: EventModelProtocal!
    var data : NSMutableData = NSMutableData()
    var userID = ""
    var eventID = ""
    var param = ""
    
    init(userID: String) {
        self.userID = userID
    }
    
    init(userID: String, eventID: String) {
        self.userID = userID
        self.eventID = eventID
    }
    
    init(param: String) {
        self.param = param
    }
    
    
    func getJSON(whichPHP: String) {
        var urlPath:String = ""
        switch whichPHP {
        case "tableIndex" :
            urlPath = urlPathTableIndex + String(userID)
        case "displayAllOrders" :
            urlPath = urlPathDisplayAllOrders + String(eventID)
        case "displayYourOrders" :
            urlPath = urlPathDisplayYourOrders + String(userID) + "eventID=" + String(eventID)
        case "friendEvents" :
            urlPath = urlPathGetFriendEvents + param
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
            let jsonRaw = try NSJSONSerialization.JSONObjectWithData(self.data, options:NSJSONReadingOptions.AllowFragments) as! NSArray
            jsonResult = jsonRaw.mutableCopy() as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let events: NSMutableArray = NSMutableArray()
        
        for(var i = 0; i < jsonResult.count; i++)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let event = EventItem(eventID: "", userID:"",eventLocation: "", expireDate: NSDate(), eventDescription: "", numOrders: 0, orderLimit: 0)
            
            let dateFormatter = NSDateFormatter();
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let eventID = jsonElement["id"] as? String,
                let userID = jsonElement["userID"] as? String,
                let eventLocation = jsonElement["eventLocation"] as? String,
                let expireDate = dateFormatter.dateFromString((jsonElement["expireDate"] as? String)!),
                let eventDescription = jsonElement["eventDescription"] as? String,
                let numOrders = Int((jsonElement["numOrders"] as? String)!),
                let orderLimit = Int((jsonElement["orderLimit"] as? String)!) {
                
                event.eventID = eventID
                event.userID = userID
                event.eventLocation = eventLocation
                event.expireDate = expireDate
                event.eventDescription = eventDescription
                event.numOrders = numOrders
                event.orderLimit = orderLimit
                events.addObject(event)
            }
            
            
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(events)
            
        })
    }
    


}
