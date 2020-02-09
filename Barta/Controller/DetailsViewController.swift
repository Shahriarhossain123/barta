//
//  DetailsViewController.swift
//  Barta
//
//  Created by apple on 2/9/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK:- Utilities
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTextField: UITextView!
    
    var img = UIImage()
    var txt = String()
    var imgurl = String()
    
    
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTextField.text = txt
        
        let url = URL(string: imgurl)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                 self.newsImageView.image = UIImage(data: data!)
            }
        }
        //self.newsImageView.image = img
        
        //navigation
        let btnShare = UIBarButtonItem(barButtonSystemItem:.action, target: self, action: #selector(btnShare_clicked))
        self.navigationItem.rightBarButtonItem = btnShare
//
       self.navigationController?.navigationBar.tintColor = UIColor.white
//
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

        // Do any additional setup after loading the view.
    }
    
    @objc func btnShare_clicked() {
        let items = [URL(string: "https://www.apple.com")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
}
