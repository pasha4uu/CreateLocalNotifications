//
//  ViewController.swift
//  CreateLocalNotifications
//
//  Created by PASHA on 30/07/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //authorization
        
        UNUserNotificationCenter.current().requestAuthorization(options:[.alert, .sound, .badge]) { (didAllow, error) in
            
        }
        
        UNUserNotificationCenter.current().delegate = self
        //Notification
        
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.body = "body"
        content.badge = 1
        content.categoryIdentifier = "category"
        
        //request
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        let request = UNNotificationRequest(identifier: "request", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        //actions
        let action = UNNotificationAction(identifier: "ok", title: "OPEN", options: .foreground)
        let category = UNNotificationCategory(identifier: "category", actions: [action], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "ok"
        {
            print("getting data......")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

