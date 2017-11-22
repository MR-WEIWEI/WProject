//
//  FeedBackVC.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/12.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class FeedBackVC: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let dataArr = ["实名认证","用户反馈","用户投诉","关于我们"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "用户反馈"
        self.initSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 100
        
        self.tableView.register(R.nib.feedBackCell(), forCellReuseIdentifier: R.nib.feedBackCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.feedBackCell.identifier) as! FeedBackCell
        
        
        
        return cell
    }
}
