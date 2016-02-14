//
//  ViewController.swift
//  GotYou
//
//  Created by Steven Wang on 2/9/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class AddOrderViewController: UIViewController {
    //MARK: Properties
    
    
    @IBOutlet weak var request: UITextView!
    @IBOutlet weak var price: UITextView!
    
    @IBOutlet weak var ordVer: UITextView!
    @IBOutlet weak var ordQuant: UITextView!
    
    
    //MARK: Variables
    var order:OrderClass!
    
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
//            let orderRequest = request.text ?? ""
//            let orderVerified = (ordVer.text ?? "") != "nil"
//            let orderQuantity = Int(ordQuant.text ?? "")
//            let orderCost = Double(price.text ?? "")
//            
//            order = OrderClass(orderID: "1", order: orderRequest, userID: 1, eventID: 1, quantity: orderQuantity!, verified: orderVerified, price: orderCost!)
//            
            
            
        }
    }
    
    
    
    
    
}

