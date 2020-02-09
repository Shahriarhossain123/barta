//
//  SearchItemVC.swift
//  Barta
//
//  Created by Apple MacBook Pro  on 2/5/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit

class SearchItemVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var searchArr = ["Top news", "A to Z", "Play News", "Home", "City", "Man", "Weman","Top news", "A to Z", "Play News", "Home", "City", "Man", "Weman","Top news", "A to Z", "Play News", "Home", "City", "Man", "Weman"]
        
        @IBOutlet weak var searchTAble: UITableView!
        @IBOutlet weak var searchBar: UISearchBar!
        
        var searching = false
        var mysearch = [String]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            searchBar.delegate = self
            searchEdit()
            
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController?.navigationBar.isTranslucent = false
              
            // Do any additional setup after loading the view.
            self.navigationItem.title = "Search News"
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searching {
                return mysearch.count
            } else{
                return searchArr.count
            }
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "search")
            
            if searching{
                cell?.textLabel?.text = mysearch[indexPath.row]
            } else{
                cell?.textLabel?.text = searchArr[indexPath.row]
            }
            return cell!
            
        }
        
        
        func searchEdit() {
            searchBar.searchTextField.layer.borderWidth = 1
            searchBar.searchTextField.layer.borderColor = UIColor.black.cgColor
            searchBar.searchTextField.layer.cornerRadius = 10
            
            searchBar.layer.backgroundColor = UIColor.black.cgColor
            searchBar.searchTextField.layer.backgroundColor = UIColor.white.cgColor
            
            UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        }

    }

//MARK: Serach Bar
    extension SearchItemVC: UISearchBarDelegate{
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           
            mysearch = searchArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            
            searching = true
            searchTAble.reloadData()
        }
        
        //Search Cancel button 
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searching = false
            searchBar.text = ""
            searchTAble.reloadData()
            self.navigationController?.popViewController(animated: true)
        }
    }
