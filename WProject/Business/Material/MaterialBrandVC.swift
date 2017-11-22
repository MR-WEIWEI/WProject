//
//  MaterialBrandVC.swift
//  WPay
//
//  Created by Weiwei on 2017/11/4.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialBrandVC: BaseViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var dataArr = Array<String>()
    var filterArr = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "选择品牌"
        self.initData()

        self.initSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() {
        
        for i in 0...100 {
            self.dataArr.append("材料品牌\(i)")
        }
        self.filterArr = self.dataArr
    }

    func initSubviews() {
        
        self.searchBar.delegate = self
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 44
    }
    
    // MARK:- tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.filterArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = self.filterArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filterArr = []
        
        for str in self.dataArr {
            
            if str.contains(searchText) {
                
                self.filterArr.append(str)
            }
        }
        self.tableView.reloadData()
        
    }
    
//    func test() -> ((Int) -> Void) {
//
//        func hello(num: Int) {
//
//            print(num)
//        }
//        return hello
//    }
}
