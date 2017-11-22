//
//  ProjectOrderVC.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/19.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class ProjectOrderVC: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let orderVModel = OrderViewModel()
    
    var dataArr = Array<DesignerListModel>()
    var pageNo: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = ""
        
        self.initSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .none
        
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.register(R.nib.projectOrderCell(), forCellReuseIdentifier: R.nib.projectOrderCell.identifier)
        
        let _ = self.tableView.setUpHeaderRefresh(refreshHeader) { [weak self] in
            
            self?.refreshData()
        }
        let _ = self.tableView.setUpFooterRefresh { [weak self] in
            
            self?.loadMoreData()
        }
        
    }
    
    // MARK:- table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //        return self.dataArr.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.projectOrderCell.identifier, for: indexPath) as! ProjectOrderCell
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.pushToViewController(DesignerProductDetailVC(), animated: true)
    }
}

extension ProjectOrderVC {
    
    func refreshData() {
        
        self.pageNo = 1
        self.dataArr = Array<DesignerListModel>()
        self.getOrderRecord()
    }
    
    func loadMoreData() {
        
        self.pageNo += 1
        self.getOrderRecord()
    }
    
    func getOrderRecord() {
        
        self.tableView.endHeaderRefreshing()
        self.tableView.endFooterRefreshing()
    }
    
    func searchUserInsurances() {
        
        self.orderVModel.searchUserInsurances(param: ["userId":CacheHandler.shared.currentUser?.userId ?? "","pageNo":1,"pageSize":10]).then { (items) -> Void in
            
            print(items)
            }.catch { (error) in
                
        }
    }
}


