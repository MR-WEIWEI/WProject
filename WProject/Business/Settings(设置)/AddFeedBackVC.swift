//
//  AddFeedBackVC.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/12.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class AddFeedBackVC: BaseViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var feedBackTypeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "添加反馈"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showSelectTypeBtnClicked(_ sender: Any) {
        
        let picker = WPicker.creatPicker(type: .normal, dataArr: ["反馈类型1","反馈类型2","反馈类型3"])
        picker.ensureBtnClickedNormalClosure = { [weak self] index in
            
            self?.feedBackTypeLabel.text = ["反馈类型1","反馈类型2","反馈类型3"][index]
        }
    }
}
