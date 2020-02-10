//
//  NotificationVC.swift
//  Barta
//
//  Created by apple on 2/6/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit
//import UserNotifications

class NotificationVC: UIViewController {

    @IBOutlet weak var palobtn: UIButton!
    @IBOutlet weak var bbcbtn: UIButton!
    @IBOutlet weak var bdnewsbtn: UIButton!
    @IBOutlet weak var dstarbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Notification"
        // Do any additional setup after loading the view.
        button_edit()
    }

    func button_edit() {
        palobtn.layer.borderWidth = 1
        palobtn.layer.borderColor = UIColor.black.cgColor
        palobtn.layer.cornerRadius = 8
    }
}
