//
//  SettingsVController.swift
//  ShareCraftsman
//
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit

class SettingsVController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let dataArr = ["实名认证","用户反馈","用户投诉","关于我们"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "设置"
        self.initSubviews()
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = self.dataArr[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            self.pushToViewController(PersionalInfoVC())
        case 1:
            self.pushToViewController(FeedBackVC())
        case 2:
            self.pushToViewController(ComplainVC())
        case 3:
            self.pushToViewController(CalendarVC())
        default:
            break
        }
    }
    
    
}
