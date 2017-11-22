//
//  SlideMenuContainerVController.swift
//  ShareCraftsman
//
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
class SlideMenuContainerVController: SlideMenuController {

    @IBAction func menuBtnClicked(_ sender: UIBarButtonItem) {
        
        self.openLeft()
        
    }
    override func awakeFromNib() {
        
        
        
        let homeVController     = HomeVController()
        self.mainViewController = BaseNaviViewController(rootViewController: homeVController)
        
        let menuVController     = MenuVController()
        self.leftViewController = menuVController
        
        SlideMenuOptions.animationDuration  = 0.2
        SlideMenuOptions.panFromBezel       = false

        super.awakeFromNib()
        

    }
}
