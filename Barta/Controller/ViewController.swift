//
//  ViewController.swift
//  Barta
//
//  Created by Apple MacBook Pro  on 2/4/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate, UNUserNotificationCenterDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        //self.navigationItem.title = "Notification"
        self.userNotificationCenter.delegate = self
        self.requestNotificationAuthorization()
        self.sendNotification()
        func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
             completionHandler()
         }

         func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
             completionHandler([.alert, .badge, .sound])
         }
        
        let item = ["Top News", "Sports","Travel","Politics","Entertainment", "Tech News"]
        
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: item, delegate: self)
        
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        carbonTabSwipeNavigation.toolbar.barTintColor = UIColor.black
        
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.orange)
        carbonTabSwipeNavigation.setIndicatorHeight(2)
        carbonTabSwipeNavigation.setTabExtraWidth(16)
        
        
        carbonTabSwipeNavigation.toolbar.clipsToBounds = true
        carbonTabSwipeNavigation.setSelectedColor(UIColor.white, font: UIFont.systemFont(ofSize: 14))
        carbonTabSwipeNavigation.setNormalColor(UIColor.lightGray, font: UIFont.systemFont(ofSize: 14))
        carbonTabSwipeNavigation.carbonTabSwipeScrollView.bounces = false
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let imageView = UIImageView(image: UIImage(named: "baratnews35"))
        let buttonItem = UIBarButtonItem(customView: imageView)
        self.navigationItem.leftBarButtonItem = buttonItem

        // Do any additional setup after loading the view.
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        if index == 0{
            let vc = storyboard?.instantiateViewController(identifier: "SearchVC") as! SearchVC
            return vc
        } else if index == 1{
            let vc = storyboard?.instantiateViewController(identifier: "sports") as! SportsVC
            return vc
        }
        else if index == 2{
            let vc = storyboard?.instantiateViewController(identifier: "travel") as! TravelVC
            return vc
        }
        else if index == 3{
            let vc = storyboard?.instantiateViewController(identifier: "politics") as! PoliticsVC
            return vc
        }else if index == 4{
            let vc = storyboard?.instantiateViewController(identifier: "enterainment") as! EntertainmentVC
            return vc
        }
        let vc = storyboard?.instantiateViewController(identifier: "tech") as! TechVC
        return vc
    }

    @IBAction func tapTOgoSearch(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SearchItemVC")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func tapToGoNotification(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "Notification")
        self.navigationController?.pushViewController(controller, animated: true)
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

