//
//  ProjectOrderCell.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/19.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class ProjectOrderCell: UITableViewCell {

    @IBOutlet weak var orderStateLabel: UILabel!
    @IBOutlet weak var orderDeadlineLabel: UILabel!
    @IBOutlet weak var orderAddressLabel: UILabel!
    
    @IBOutlet weak var ensureBtn: UIButton!
    
    var btnClickedClosure: ((_ order: String)->Void)?
    
    var order = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        self.btnClickedClosure?(order)
    }
    
    func setUserType() {
        
        let type: Int = 1
        
        switch type {
        case 1:
            self.ensureBtn.setTitle("确认工人到场", for: .normal)
        case 2:
            self.ensureBtn.setTitle("取消订单", for: .normal)
        default:
            break
        }
    }
}
