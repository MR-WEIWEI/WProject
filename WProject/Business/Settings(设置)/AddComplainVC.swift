//
//  AddComplainVC.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/12.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class AddComplainVC: BaseViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var complainTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "添加投诉"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSelectTypeBtnClicked(_ sender: Any) {
        
        let picker = WPicker.creatPicker(type: .normal, dataArr: ["投诉类型1"])
        picker.ensureBtnClickedNormalClosure = { [weak self] index in
            
            self?.complainTypeLabel.text = ["投诉类型1"][index]
        }
    }
    
}
