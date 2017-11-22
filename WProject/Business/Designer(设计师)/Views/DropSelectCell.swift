//
//  DropSelectCell.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/10/29.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class DropSelectCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var model = DropSelectModel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViewWithModel(model: DropSelectModel) {
        
        self.model = model
        self.titleLabel.text = model.name
    }
}
