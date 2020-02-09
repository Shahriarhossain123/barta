//
//  EntertainmentVC.swift
//  Barta
//
//  Created by Apple MacBook Pro  on 2/5/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit
import AlamofireImage

class EntertainmentVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var entertainmenttabel: UITableView!
        
        var modelData = [MyModel]()
        
        var titleName = [String]()
        var imageName = [String]()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            entertainmenttabel.rowHeight = 405
            loadData()
        }
        
        func loadData() {
            let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
            URLSession.shared.dataTask(with: url!){(data, response, error) in
                if error == nil {
                    do{
                        let myData = try!JSONDecoder().decode([MyModel].self, from: data!)
                        DispatchQueue.main.async {
                            for item in myData{
                                self.titleName.append(item.title)
                                self.imageName.append(item.url)
                                //print(self.imageName)
                            }
                            self.entertainmenttabel.reloadData()
                        }
                    }catch{
                        print(":( Nothing Found")
                    }
                }
            }.resume()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return imageName.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchCell
            
            if let imgUrl = imageName[indexPath.row] as? String {
                if let url = URL(string: imgUrl){
                    cell.newsimage.af_setImage(withURL: url)
                }
            }
            
            cell.textlable.text = titleName[indexPath.row]
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
            vc.imgurl = imageName[indexPath.row]
            vc.txt = titleName[indexPath.row]
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
