//
//  SportsVC.swift
//  Barta
//
//  Created by Apple MacBook Pro  on 2/5/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit

class SportsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
 var newArrary = ["b","b-1","b-2","b-3","b-4"]
    
    @IBOutlet weak var sportsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sportsTable.rowHeight = 405
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArrary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchCell
        
        cell.newsimage.image = UIImage(named: newArrary[indexPath.row])
        
        return cell
    }

}

