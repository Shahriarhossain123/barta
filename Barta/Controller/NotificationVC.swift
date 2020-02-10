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
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
        button_edit()
    }

    func button_edit() {
        //MARK: Palo
        palobtn.layer.borderWidth = 1
        palobtn.layer.borderColor = UIColor.black.cgColor
        palobtn.layer.cornerRadius = 8
        palobtn.layer.backgroundColor = UIColor.systemOrange.cgColor
        
        //MARK: dstarbtn
        dstarbtn.layer.borderWidth = 1
        dstarbtn.layer.borderColor = UIColor.black.cgColor
        dstarbtn.layer.cornerRadius = 8
        dstarbtn.layer.backgroundColor = UIColor.yellow.cgColor
        
        //MARK: bdnewsbtn
        bdnewsbtn.layer.borderWidth = 1
        bdnewsbtn.layer.borderColor = UIColor.black.cgColor
        bdnewsbtn.layer.cornerRadius = 8
        bdnewsbtn.layer.backgroundColor = UIColor.systemOrange.cgColor
        
        
        //MARK: bbcbtn
        bbcbtn.layer.borderWidth = 1
        bbcbtn.layer.borderColor = UIColor.black.cgColor
        bbcbtn.layer.cornerRadius = 8
        bbcbtn.layer.backgroundColor = UIColor.yellow.cgColor
        
    }
    
    @IBAction func bbcaction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "paper") as! ShowPaperVC
        vc.url = "https://www.bbc.com"
        vc.navtitle = "BBC"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bdaction(_ sender: UIButton) {
       let vc = storyboard?.instantiateViewController(identifier: "paper") as! ShowPaperVC
        vc.url = "http://bdnews24.com"
        vc.navtitle = "BDNEWS24"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dsaction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "paper") as! ShowPaperVC
        vc.url = "https://www.thedailystar.net"
        vc.navtitle = "The Daily Star"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func paction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "paper") as! ShowPaperVC
        vc.url = "https://www.prothomalo.com"
        vc.navtitle = "Prothomalo"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
