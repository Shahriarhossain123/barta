//
//  SearchVC.swift
//  Barta
//
//  Created by Apple MacBook Pro  on 2/4/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit
import AlamofireImage

class SearchVC: UIViewController {
//MARK: Outlets and var
    @IBOutlet weak var searchtabel: UITableView!
    
    var modelData = [MyModel]()
    
    var titleName = [String]()
    var imageName = [String]()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        searchtabel.rowHeight = 405
        // Do any additional setup after loading the view.
        loadData()
    }
    
    func loadData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error == nil {
                do{
                    let myData = try! JSONDecoder().decode([MyModel].self, from: data!)
                    DispatchQueue.main.async {
                        for n in myData{
                            self.titleName.append(n.title)
                            self.imageName.append(n.url)
                            //print(self.imageName)
                        }
                        self.searchtabel.reloadData()
                    }
                }catch{
                    print(":( Nothing Found")
                }
            }
        }.resume()
    }
}

extension SearchVC: UITableViewDataSource,UITableViewDelegate{
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
        
//        let url = URL(string: imageName[indexPath.row])
//
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!)
//            DispatchQueue.main.async {
//                cell.newsimage.image = UIImage(data: data!)
//            }
//        }
//        let url = URL(string: imageName[indexPath.row])
//        let data = try? Data(contentsOf: url!)
//        cell.newsimage.image = UIImage(data: data!)
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        vc.imgurl = imageName[indexPath.row]
        vc.txt = titleName[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
