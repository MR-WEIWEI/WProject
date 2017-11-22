//
//  DesignerListCell.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/10/29.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class DesignerListCell: UITableViewCell {
    
    var model = DesignerListModel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViewWithModel(model: DesignerListModel) {
        
        self.model = model
    }
}
