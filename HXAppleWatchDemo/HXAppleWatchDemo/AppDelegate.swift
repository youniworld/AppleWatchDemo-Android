//
//  AppDelegate.swift
//  HXAppleWatchDemo
//
//  Created by youni on 15/4/1.
//  Copyright (c) 2015年 youni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,IChatManagerDelegate{

    var window: UIWindow?

    var callback:(([NSObject : AnyObject]!) -> Void)!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let apnsCertName:String = "chatdemoui";
        
        EaseMob.sharedInstance().registerSDKWithAppKey("easemob-demo#chatdemoui", apnsCertName: apnsCertName)
        
        EaseMob.sharedInstance().chatManager.addDelegate(self, delegateQueue: nil)
        
        EaseMob.sharedInstance().chatManager.asyncLoginWithUsername("tt1", password: "1", completion: { (loginInfo,error) -> Void in
            
            NSLog("login callback : ")
            
            HXSDKHelper.instance.sendTextMessage("uni3", textMessge:"test from")
            }, onQueue: nil)

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication!, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]!, reply: (([NSObject : AnyObject]!) -> Void)!) {
        
        if(userInfo != nil){
            if userInfo!["action"] != nil{
                var action:String = userInfo!["action"] as String
                
                if action == "getcontact"{
                    reply!(["contacts":["uni3","uni5","tt2"]])
                }else if action == "send"{
                    var name:String = userInfo!["name"] as String
                    var message:String = userInfo!["message"] as String
                    NSLog("name : " + name + "message : " + message)
                    HXSDKHelper.instance.sendTextMessage(name, textMessge:message)
                    callback = reply
                }
            }
        }
    }

    func didSendMessage(message: EMMessage!, error: EMError!) {
        if(error != nil){
            callback!(["send":error!.errorCode.value])
        }else{
            callback!(["send":"ok"])
        }
    }
    
    func didReceiveMessage(message: EMMessage!) {
        
    }
}

