//
//  ViewController.swift
//  GotYou
//
//  Created by Steven Wang on 2/9/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var duration: UITextField!
    @IBOutlet weak var orderLimit: UITextField!

    
    //MARK: Variables
    var event:EventItem!
    
    //MARK: Buttons
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (saveButton === sender) {
            let dataDict:NSMutableDictionary = NSMutableDictionary()
            let startDate = NSDate()
            let date = startDate.dateByAddingTimeInterval(Double(duration.text!)! * 60.0)
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            let dateString:String = dateFormatter.stringFromDate(date)
            
            dataDict.setValue(eventDescription.text, forKey: "eventDescription")
            dataDict.setValue(location.text, forKey:"eventLocation")
            dataDict.setValue(orderLimit.text, forKey:"orderLimit")
            dataDict.setValue(dateString, forKey:"eventDate")
            dataDict.setValue(FBSDKAccessToken.currentAccessToken().userID, forKey: "userID")
            
            let addModel = AddModel(dataParams: dataDict)
            addModel.postToPHP()
            
        }
    }
    
    
    


}

