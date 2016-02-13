//
//  ViewController.swift
//  GotYou
//
//  Created by Steven Wang on 2/12/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, FBSDKLoginButtonDelegate  {

    var userID:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            userID = FBSDKAccessToken.currentAccessToken().userID
//            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("TabBarController") as! TabBarController
//            //secondViewController.userID = Int(FBSDKAccessToken.currentAccessToken().userID)!
//            self.navigationController!.pushViewController(secondViewController, animated: true)
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
