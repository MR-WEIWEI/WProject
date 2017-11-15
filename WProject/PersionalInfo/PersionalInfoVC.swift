//
//  PersionalInfoVC.swift
//  WProject
//
//  Created by WeiWei on 2017/11/15.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class PersionalInfoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArr = [(String,String)]()
    var modelArr = [EditCellModel]()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.naviTitle = "发布项目"
        self.initData()
        self.initSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() {
        
        self.dataArr = [("昵称",""),("性别",""),("年龄",""),("出生地",""),("居住地",""),("经验年数",""),("结束时间","")]
        
        for (title, unit) in self.dataArr {
            
            let publicModel = EditCellModel()
            publicModel.title = title
            publicModel.unit = unit
            
            switch title {
                
            case "发包类型":
                publicModel.type = .selectNormal
                publicModel.dataArr = ["发包1","发包2","发包3"]
            case "需要工种":
                publicModel.type = .selectNormal
                publicModel.dataArr = ["工种1","工种2","工种3"]
            case "开工时间":
                publicModel.type = .selectTime
            case "结束时间":
                publicModel.type = .selectTime
            default:
                break
            }
            
            self.modelArr.append(publicModel)
        }
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 50
        self.tableView.register(R.nib.editCell(), forCellReuseIdentifier: R.nib.editCell.identifier)
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.modelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.editCell.identifier) as! EditCell
        
        cell.setView(model: self.modelArr[indexPath.row])
        
        return cell
    }
}

