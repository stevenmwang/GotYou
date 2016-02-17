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
            let startDate = NSDate()
            let eventDesc = eventDescription.text ?? ""
            let eventLoc = location.text ?? ""
            let orderLim = Int(orderLimit.text ?? "")!
            let date = startDate.dateByAddingTimeInterval(5.0 * 60.0)
            
            event = EventItem(eventID: "", userID: "", eventLocation: eventLoc, expireDate: date, eventDescription: eventDesc, numOrders: 0, orderLimit: orderLim)
            
        }
    }
    
    
    


}

