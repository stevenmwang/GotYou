//
//  OrderTableViewController.swift
//  GotYou
//
//  Created by Steven Wang on 2/13/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController, EventModelProtocal {

    @IBOutlet weak var listTableView: UITableView!
    var orders = [OrderClass]()
    var userID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (orders.count == 0) {
            let eventModel = EventModel(userID: userID)
            eventModel.delegate = self
            eventModel.getJSON()
        }
        
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        orders = items as! [OrderClass]
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
        return orders.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "orderTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! OrderTableViewCell
        let order = orders[indexPath.row]
        
//        cell.eventID.text = String(order.eventID)
        cell.price.text = String(order.price)
        cell.quantity.text = String(order.quantity)
        cell.verified.text = String(order.verified)
        cell.order.text = order.order
        
        
        
        return cell
    }
    
    @IBAction func unwindToEventList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AddOrderViewController, order = sourceViewController.order {
            // Add a new meal.
            let newIndexPath = NSIndexPath(forRow: orders.count, inSection: 0)
            orders.append(order)
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

