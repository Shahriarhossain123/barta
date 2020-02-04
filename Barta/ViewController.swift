//
//  ViewController.swift
//  Barta
//
//  Created by Apple MacBook Pro  on 2/4/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        // Do any additional setup after loading the view.
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let vc = storyboard?.instantiateViewController(identifier: "SearchVC") as! SearchVC
        return vc
    }

}

