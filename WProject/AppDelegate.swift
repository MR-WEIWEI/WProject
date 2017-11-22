//
//  AppDelegate.swift
//  WProject
//
//  Created by WeiWei on 2017/11/15.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit
import MonkeyKing
import MagicalRecord
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        
        
        
        setupAppData()
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().toolbarDoneBarButtonItemText = "完成"
        
        
        
        
        return true
    }
    
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        if MonkeyKing.handleOpenURL(url) {
            return true
        }
        
        return false
    }
    
    
    func setupAppData() {
        
        MagicalRecord.setupAutoMigratingCoreDataStack()
        
        let appSetting              = DBManager.shared.checkAppSettings()
        appSetting.appVersion       = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        appSetting.buildVersion     = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        appSetting.launchTimes      += 1
        appSetting.lastLaunchDate   = Date()
        appSetting.deviceId         = UIDevice.current.identifierForVendor?.uuidString
        
        CacheHandler.shared.currentUser = DBManager.shared.checkCurrentLoggedInUser()
        
        saveDataToDB()
    }
    
}

