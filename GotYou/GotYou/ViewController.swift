//
//  ViewController.swift
//  GotYou
//
//  Created by Steven Wang on 2/12/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, FBSDKLoginButtonDelegate  {

    
    @IBOutlet weak var profImage: UIImageView!
    
    var userID:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pictureRequest = FBSDKGraphRequest(graphPath: "me/picture?type=large&redirect=false", parameters: nil)
        pictureRequest.startWithCompletionHandler({
            (connection, result, error: NSError!) -> Void in
            if error == nil {
                let resultDict = result as! NSDictionary
                let data : NSDictionary = resultDict["data"] as! NSDictionary
                let dataURL:String = data["url"] as! String
                let url = NSURL(string: dataURL)
                let profData = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                self.profImage.image = UIImage(data: profData!)
            }
        })

        
        
        
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
//            var fbRequest = FBSDKGraphRequest(graphPath:"/me/friends", parameters: nil);
//            fbRequest.startWithCompletionHandler { (connection : FBSDKGraphRequestConnection!, result : AnyObject!, error : NSError!) -> Void in
//                var resultDict = result as! NSDictionary
//                print(resultDict)
//                var data : NSArray = resultDict["data"] as! NSArray
//                
//                for i in 0...data.count-1 {
//                    let valueDict : NSDictionary = data[i] as! NSDictionary
//                    let id = valueDict.objectForKey("id") as! String
//                    print("the id value is \(id)")
//                }
//            }
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("EventTableViewController") as! EventTableViewController
                
                self.navigationController!.pushViewController(secondViewController, animated: true)
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        let VC = segue.destinationViewController as! TabBarController
        VC.userID = userID
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
