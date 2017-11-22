//
//  SlideMenuCell.swift
//  XianMuShu
//
//  Created by pandaApe on 29/10/2017.
//  Copyright © 2017 pandaApe. All rights reserved.
//

import UIKit

class SlideMenuCell: UITableViewCell {
    
    @IBOutlet weak var titleIconIv: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var badgeLbl: UILabel!
    
    var cellData: MenuData! {
        
        didSet {
            
            self.titleIconIv.image  = cellData.image
            self.titleLbl.text      = cellData.title
            self.badgeLbl.isHidden  = !cellData.showBadge
        }
    }
    
}
