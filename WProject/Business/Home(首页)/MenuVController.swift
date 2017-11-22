//
//  MenuVController.swift
//  ShareCraftsman
//
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit

typealias MenuData = (title:String, image:UIImage?, showBadge:Bool)

class MenuVController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userPhoneLbl: UILabel!
    @IBOutlet weak var userTypeLbl: UILabel!
    @IBOutlet weak var userAvatarIV: UIImageView!
    @IBOutlet weak var userLevelLbl: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var appVersionLbl: UILabel!
    
    var dataArray: [MenuData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "锨木鼠"
        
        menuTableView.register(R.nib.slideMenuCell)
        
        userAvatarIV.image = R.image.app_sample()
        
        dataArray = [
            ("保险", R.image.icon_userCenter_insurance(), true),
            ("订单", R.image.icon_userCenter_order(), true),
            ("城市合伙人", R.image.icon_userCenter_partner(), false),
            ("设置", R.image.icon_userCenter_setting(), false),
            ("成为VIP", R.image.icon_userCenter_setting(), false)
            
        ]
        let appVer   = CacheHandler.shared.currentSettings.appVersion
        let buildVer = CacheHandler.shared.currentSettings.buildVersion
        appVersionLbl.text = "v\(appVer ?? "")(\(buildVer ?? ""))"
        
    }
    
}

extension MenuVController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell        = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.slideMenuCell, for: indexPath)!
        
        cell.cellData   = dataArray[indexPath.row]
    
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 3 {
            // 设置
            
            self.pushToViewController(SettingsVController())
            
        }
    }
    
}












