//
//  ViewController.swift
//  HXAppleWatchDemo
//
//  Created by youni on 15/4/1.
//  Copyright (c) 2015年 youni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var login: UIButton!
    
    override init() {
        super.init();
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onLogin(sender: AnyObject) {
        NSLog("password : " + password.text!)
        NSLog("userid : " + name.text!)
    }
}

