//
//  PlaceOrderTableViewController.swift
//  GotYou
//  To do: set property listener for friends variable
//
//  Created by Steven Wang on 2/16/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class PlaceOrderTableViewController: UITableViewController, EventModelProtocal {
    var events = [EventItem]()
    var friends = [String]()
    var friendNames = [String()]
    
    @IBOutlet var listTableView: UITableView!
    
    var currentFriendName = "" {
        didSet {
            friendNames.append(currentFriend)
        }
    }

    var currentFriend = "" {
        didSet {
            friends.append(currentFriend)
        }
    }
    
    var isFinished = false {
        didSet {
            findFriendOrders()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFriends()
        
    }
    
    func getFriends() {
        let fbRequest = FBSDKGraphRequest(graphPath:"me/friends", parameters: nil);
        fbRequest.startWithCompletionHandler { (connection : FBSDKGraphRequestConnection!, result : AnyObject!, error : NSError!) -> Void in
            let resultDict = result as! NSDictionary
            let data : NSArray = resultDict["data"] as! NSArray
            print(data)
            for i in 0...data.count-1 {
                let valueDict : NSDictionary = data[i] as! NSDictionary
                let id = valueDict.objectForKey("id") as! String
                self.currentFriend = id
                
                let id1 = valueDict.objectForKey("name") as! String
                self.currentFriendName = id1
            }
            self.isFinished = true
        }
    }
    
    func findFriendOrders() {
        if (self.friends.count != 0) {
            let strRaw:String = friends.joinWithSeparator(",")
            let strParam = "(\(strRaw))"
            let friendModel = EventModel(param: strParam)
            friendModel.delegate = self
            friendModel.getJSON("friendEvents")
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
        let cellIdentifier = "PlaceOrderTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PlaceOrderTableViewCell
        let event = events[indexPath.row]
        
        let dateForm = NSDateFormatter()
        dateForm.dateFormat = "hh:mm"
        let dateString = dateForm.stringFromDate(event.expireDate)
        let orderDis = String(event.numOrders) + "/" + String(event.orderLimit)
        
        cell.eventLocation.text = event.eventLocation
        cell.eventDescription.text = event.eventDescription
        cell.numOrders.text = orderDis
        cell.expireDate.text = dateString
        
        let pictureRequest = FBSDKGraphRequest(graphPath: "\(event.userID)/picture?type=large&redirect=false", parameters: nil)
        pictureRequest.startWithCompletionHandler({
            (connection, result, error: NSError!) -> Void in
            if error == nil {
                let resultDict = result as! NSDictionary
                let data : NSDictionary = resultDict["data"] as! NSDictionary
                let dataURL:String = data["url"] as! String
                let url = NSURL(string: dataURL)
                let profData = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                cell.friendPicture.image = UIImage(data: profData!)
            }
        })
        
        let nameRequest = FBSDKGraphRequest(graphPath: "\(event.userID)", parameters: nil)
        nameRequest.startWithCompletionHandler({
            (connection, result, error: NSError!) -> Void in
            if error == nil {
                let nameDict = result as! NSDictionary
                let name : String = nameDict["name"] as! String
                cell.friendName.text = name
            }
        })

        
        return cell
    }
    /*
    Make sure to change this function, so the correct menu is selected. Right now it's defaulted to Crepevine, but this is not always the case. It is determined by
    the row of the table selected
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("MenuSegue", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "MenuSegue") {
            let desVC:MenuTableViewController = (segue.destinationViewController as! UINavigationController).viewControllers.first as! MenuTableViewController
            let locmod = LocuModel()
            let menus = locmod.getMenu("Crepevine", city: "Palo Alto")
            desVC.menus = menus
        }
    }
    
    @IBAction func backToPlaceOrderTableViewController(segue:UIStoryboardSegue) {
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
