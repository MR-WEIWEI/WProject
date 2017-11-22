//
//  PublicProjectVC.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/10.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class PublicProjectVC: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    var dataArr = [(String,String)]()
    var modelArr = [PublicProjectModel]()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "发布项目"
        self.initData()
        self.initSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() {
        
        self.dataArr = [("发包类型",""),("面积","平米"),("预算价格","万元"),("需要工种",""),("需要人数","人"),("开工时间",""),("结束时间","")]
        
        for (title, unit) in self.dataArr {
            
            let publicModel = PublicProjectModel()
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
        self.tableView.register(R.nib.publicProjectCell(), forCellReuseIdentifier: R.nib.publicProjectCell.identifier)
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        // TODO
        self.pushToViewController(ProjectOrderVC())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.modelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.publicProjectCell.identifier) as! PublicProjectCell
        
        cell.setView(model: self.modelArr[indexPath.row])
        
        return cell
    }
}
