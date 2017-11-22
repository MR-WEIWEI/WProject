//
//  InsuranceVC.swift
//  WPay
//
//  Created by Weiwei on 2017/11/1.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class InsuranceVC: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var addedPersonArr = Array<PersonModel>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "购买保险"
        self.initSubviews()
        
        self.jumpToLoginVC()
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(R.nib.insuranceTtitleCell(), forCellReuseIdentifier: R.nib.insuranceTtitleCell.identifier)
        self.tableView.register(R.nib.insuranceEditCell(), forCellReuseIdentifier: R.nib.insuranceEditCell.identifier)
        
        self.tableView.estimatedRowHeight = 200
        self.tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        self.navigationController?.pushViewController(EnsureInsuranceVC(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.insuranceTtitleCell.identifier) as! InsuranceTtitleCell
            cell.titleLabel.text = "投保年龄：30天-60周岁；保险费：2元/天；保险责任：意外身故，2万元; 意外伤残，2万元; 意外医疗：500元,其中意外医疗门诊住院均可，100元免赔额，80%理赔。"
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.insuranceEditCell.identifier) as! InsuranceEditCell
            cell.addMoreBtnClickCloure = {
                
                self.navigationController?.pushViewController(AddMorePersonVC(), animated: true)
            }
            
            return cell
        }
    }
}
