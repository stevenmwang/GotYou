//
//  EventTableViewController.swift
//  GotYou
//
//  Created by Steven Wang on 2/10/16.
//  Copyright © 2016 Stanford. All rights reserved.
//  asdf

import UIKit

class EventTableViewController: UITableViewController, EventModelProtocal {


    @IBOutlet weak var listTableView: UITableView!
    var events = [EventItem]()
    var userID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (events.count == 0) {
            let eventModel = EventModel(userID: userID)
            eventModel.delegate = self
            eventModel.getJSON("tableIndex")
        }
        
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        events = items as! [EventItem]
        self.listTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "EventTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell
        let event = events[indexPath.row]
        
        let dateForm = NSDateFormatter()
        dateForm.dateFormat = "hh:mm"
        let dateString = dateForm.stringFromDate(event.expireDate)
        let orderDis = String(event.numOrders) + "/" + String(event.orderLimit)
        
        cell.location.text = event.eventLocation
        cell.eventDesc.text = event.eventDescription
        cell.numOrders.text = orderDis
        cell.timeEnd.text = dateString
        
        return cell
    }
    
    @IBAction func unwindToEventList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AddEventViewController, event = sourceViewController.event {
            // Add a new meal.
            let newIndexPath = NSIndexPath(forRow: events.count, inSection: 0)
            events.append(event)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
