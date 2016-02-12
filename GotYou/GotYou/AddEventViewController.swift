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
            
            event = EventItem(location: eventLoc, startDate: eventStartDate, duration: 0, eventDesc: eventDesc, cost:0, numOrders:0 )
            
        }
    }
    
    
    


}

