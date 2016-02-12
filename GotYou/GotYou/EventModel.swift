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
    let urlPath:String = "http://localhost/service.php"
    weak var delegate: EventModelProtocal!
    var data : NSMutableData = NSMutableData()
    
    func getJSON() {
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
        let events: NSMutableArray = NSMutableArray()
        
        for(var i = 0; i < jsonResult.count; i++)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let event = EventItem(location: "", startDate: NSDate(), duration: 0, eventDesc: "", cost: 0, numOrders: 0)
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let eventLoc = jsonElement["eventLocation"] as? String,
                let duration = Int((jsonElement["duration"] as? String)!),
                let eventDesc = jsonElement["eventDescription"] as? String,
                let cost = Int((jsonElement["cost"] as? String)!),
                let numOrders = Int((jsonElement["numOrders"] as? String)!) {
                
                event.eventLocation = eventLoc
                event.duration = NSInteger(duration)
                event.eventDescription = eventDesc
                event.cost = cost
                event.numOrders = numOrders
                
            }
            
            events.addObject(event)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(events)
            
        })
    }
    


}
