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
        cell.valueChangedClosure = { [weak self] newValue in
            
            print(newValue)
            self?.saveData()
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.view.endEditing(true)
    }
}

extension PersionalInfoVC {
    
    func initData() {
        
        self.dataArr = [("昵称",""),("性别",""),("年龄",""),("出生地",""),("居住地",""),("经验年数",""),("支付类型",""),("支付账号",""),("用户类型",""),("工种",""),("报价",""),("收货地址","")]
        
        for (title, unit) in self.dataArr {
            
            let publicModel = EditCellModel()
            publicModel.title = title
            publicModel.unit = unit
            
            switch title {
                
            case "性别":
                publicModel.type = .selectNormal
                publicModel.dataArr = ["男","女"]
            case "出生地":
                publicModel.type = .selectNormal
                publicModel.dataArr = ["工种1","工种2","工种3"]
            case "居住地":
                publicModel.type = .selectTime
            case "结束时间":
                publicModel.type = .selectTime
            default:
                break
            }
            
            self.modelArr.append(publicModel)
        }
    }
}

extension PersionalInfoVC {
    
    func saveData() {
        
    }
}

