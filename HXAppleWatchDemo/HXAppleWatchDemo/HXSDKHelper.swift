//
//  HXSDKHelper.swift
//  swittest
//
//  Created by youni on 15/3/15.
//  Copyright (c) 2015年 youni. All rights reserved.
//

import Foundation

private var gInstance = HXSDKHelper()

class HXSDKHelper : NSObject{
    class var instance:HXSDKHelper{
        return gInstance
    }

    func sendTextMessage(to : String, textMessge : String){
        var latestMessage:EMMessage = EMMessage()
        var chatText:EMChatText = EMChatText(text: textMessge)
        var txtBody:EMTextMessageBody = EMTextMessageBody(chatObject: chatText)
        
        latestMessage.addMessageBody(txtBody);
        latestMessage.to = to;
        EaseMob.sharedInstance().chatManager.asyncSendMessage(latestMessage, progress: nil);
    }
}