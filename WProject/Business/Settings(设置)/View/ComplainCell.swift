//
//  ComplainCell.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/12.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class ComplainCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
