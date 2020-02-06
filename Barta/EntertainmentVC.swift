//
//  EntertainmentVC.swift
//  Barta
//
//  Created by Apple MacBook Pro  on 2/5/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit

class EntertainmentVC: UIViewController {

    @IBOutlet weak var entertainmenttabel: UITableView!
        
        var newArrary = ["a","a-1","a-2","a-3","a-4"]
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        

    }

    extension EntertainmentVC: UITableViewDataSource,UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newArrary.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchCell
            
            cell.newsimage.image = UIImage(named: newArrary[indexPath.row])
            
            return cell
            
        }
        
    }
