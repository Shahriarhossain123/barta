//
//  ShowPaperVC.swift
//  Barta
//
//  Created by apple on 2/10/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit
import WebKit

class ShowPaperVC: UIViewController, WKNavigationDelegate{
    
    var url = String()
    var navtitle = String()
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = navtitle
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let urls = URL(string: url)!
        webView.load(URLRequest(url: urls))
        webView.allowsBackForwardNavigationGestures = true
        

        // Do any additional setup after loading the view.
    }
}
