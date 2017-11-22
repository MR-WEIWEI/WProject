//
//  ValidInsuranceOrderCell.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/19.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class ValidInsuranceOrderCell: UITableViewCell {

    @IBOutlet weak var insuranceTypeNameLabel: UILabel!
    @IBOutlet weak var insuranceOrderNumLabel: UILabel!
    @IBOutlet weak var applicantNameLabel: UILabel!
    @IBOutlet weak var insuredNameLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
