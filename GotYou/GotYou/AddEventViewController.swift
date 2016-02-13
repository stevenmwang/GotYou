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
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var orderLimit: UITextField!
    @IBOutlet weak var numOrders: UITextField!
    
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
            let eventDesc = eventDescription.text ?? ""
            let eventLoc = location.text ?? ""
            let eventStartDate = startDate.date
            let maxOrders = Int(orderLimit.text ?? "")!
            let currentNumOrders = Int(numOrders.text ?? "")!
            
            
            event = EventItem(eventID: "", userID: "", eventLocation: eventLoc, expireDate: eventStartDate, eventDescription: eventDesc, numOrders: currentNumOrders, orderLimit: maxOrders)
            
        }
    }
    
    
    


}

