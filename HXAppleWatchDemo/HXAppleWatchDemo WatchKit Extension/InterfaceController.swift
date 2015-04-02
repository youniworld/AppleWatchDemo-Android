//
//  InterfaceController.swift
//  HXAppleWatchDemo WatchKit Extension
//
//  Created by youni on 15/4/1.
//  Copyright (c) 2015年 youni. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var open: WKInterfaceButton!
    
    @IBAction func openApp() {
        InterfaceController.openParentApplication(["action":"getcontact"], reply: {(info:[NSObject : AnyObject]!, error:NSError!) -> Void in
            if info != nil{
                if info.count > 0{
                    self.getContacts(info!["contacts"] as [String])
                }
            }
        })
    }
    
    func getContacts(contacts:[String]){
        presentTextInputControllerWithSuggestions(contacts, allowedInputMode: WKTextInputMode.Plain, completion: {(result:[AnyObject]!)-> Void in
            if result != nil{
                var id:String = result[0] as String
                var date:NSDate = NSDate()
                var now:NSTimeInterval = date.timeIntervalSinceNow
                
                self.sendMessage(id,text: now.description)
            }
            }
        )
    }
    
    func sendMessage(id:String,text:String){
        InterfaceController.openParentApplication(["action":"send","name":id,"message":text], reply: {(info:[NSObject : AnyObject]!, error:NSError!) -> Void in
            
        })
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
