//
//  DesignerListVController.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/10/28.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class DesignerListVController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dropSelectViewHeightContrains: NSLayoutConstraint!
    @IBOutlet weak var dropSelectView: DropSelectView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataArr = Array<DesignerListModel>()
    var pageNo: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "设计师"
        
        self.initData()

        self.initSubviews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() {
        
        for _ in 0...10 {
            
            self.dataArr.append(DesignerListModel())
        }
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .none
        
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.register(R.nib.designerListCell(), forCellReuseIdentifier: R.nib.designerListCell.identifier)
        
        let _ = self.tableView.setUpHeaderRefresh(refreshHeader) { [weak self] in
            
            self?.refreshData()
        }
        let _ = self.tableView.setUpFooterRefresh { [weak self] in
            
            self?.loadMoreData()
        }
        
        self.dropSelectView.changeOpenStatus = { isOpen in
            
            if isOpen {
                self.dropSelectViewHeightContrains.constant = 1000
            }
            else {
                self.dropSelectViewHeightContrains.constant = 44
            }
            
            self.view.layoutIfNeeded()
        }
        
        self.dropSelectView.selectedClosure = {[weak self] selectedArr in
            
            self?.pushToViewController(XLoginVController())
        }
    }
    
    // MARK:- table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 70
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.designerListCell.identifier, for: indexPath) as! DesignerListCell
        
        if self.dataArr.count > indexPath.row {
            
            cell.setViewWithModel(model: self.dataArr[indexPath.row])
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.pushToViewController(DesignerProductDetailVC(), animated: true)
    }
}

extension DesignerListVController {
    
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
}
