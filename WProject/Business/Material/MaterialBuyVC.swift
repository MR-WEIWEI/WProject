//
//  MaterialBuyVC.swift
//  WPay
//
//  Created by WeiWei on 2017/11/3.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialBuyVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "提交订单"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func aliPayBtnCliked(_ sender: Any) {
    }
    
    @IBAction func weChatPayBtnCliked(_ sender: Any) {
    }
    @IBAction func offLinePayBtnCliked(_ sender: Any) {
        
        self.navigationController?.pushViewController(MaterialOrderVC(), animated: true)
    }
}
