//
//  NotificationVC.swift
//  Barta
//
//  Created by apple on 2/6/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit
import UserNotifications

class NotificationVC: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Notification"
        self.userNotificationCenter.delegate = self
        self.requestNotificationAuthorization()
        self.sendNotification()
        func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
             completionHandler()
         }

         func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
             completionHandler([.alert, .badge, .sound])
         }
        // Do any additional setup after loading the view. 
    }
    
       let userNotificationCenter = UNUserNotificationCenter.current()
       let notificationContent = UNMutableNotificationContent()
       
       
       func requestNotificationAuthorization(){
           let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
           self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
               if let error = error {
                   print("Error: ", error)
               }
           }
       }
    
       func sendNotification() {
           notificationContent.title = "Bad News"
           notificationContent.body = "World War 3 Will Start Soon!!!"
           notificationContent.badge = NSNumber(value: 3)
           if let url = Bundle.main.url(forResource: "dune", withExtension: "png"){
               if let attchment = try? UNNotificationAttachment(identifier: "dune", url: url, options: nil){
                   notificationContent.attachments = [attchment]
               }
           }
           let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
           let request = UNNotificationRequest(identifier: "testNotifications", content: notificationContent, trigger: trigger)
           userNotificationCenter.add(request){ (error) in
               if let error = error {
                   print("notification Error :",error)
               }
               
           }
       }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
