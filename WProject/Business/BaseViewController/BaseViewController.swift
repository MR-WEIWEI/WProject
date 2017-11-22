//
//  BaseViewController.swift
//  66FM
//
//  Copyright © 2017 Sunfit. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    lazy var refreshHeader  = RefreshHeader(frame: CGRect(x: 0,y: 0,width: screenWidth, height: 450))
    lazy var loadMoreFooter = LoadMoreFooter(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 50))
    //    var callBackClosure = SwiftClosure?()
    
    var naviTitle:String? {
        set{
            
            self.navigationItem.title = newValue
        }
        
        get{
            
            return self.navigationItem.title
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !self.checkNavRootVC() {
            
            self.setNavBackPopStyle()
        }
    }
    
    private func checkNavRootVC () -> Bool {
        
        if self.navigationController?.viewControllers[0] == self {
            
            return true
        }
        else{
            return false
        }
    }
    
    /// 默认返回样式 pop
    func setNavBackPopStyle() {
        
        let btnItem = UIBarButtonItem.init(image: R.image.navigationBack(), style: UIBarButtonItemStyle.plain, target: self, action: #selector(popViewController))
        
        btnItem.tintColor = UIColor.gray
        
        //        btnItem.imageInsets = UIEdgeInsetsMake(0, 10, 0, 10)
        
        self.navigationItem.setLeftBarButton(btnItem, animated: true)
    }
    
    /// 返回样式 dismiss
    func setNavBackDismissStyle() {
        
        //        let btnItem = UIBarButtonItem.init(image: R.image.navigationBack(), style: UIBarButtonItemStyle.plain, target: self, action: #selector(dismissViewController))
        //
        //        btnItem.tintColor = UIColor.white
        //
        //        btnItem.imageInsets = UIEdgeInsetsMake(0, -10, 0, 10)
        //
        //        self.navigationItem.setLeftBarButton(btnItem, animated: true)
    }
    
    
    func dismissViewController() {
        
        self.dismiss(animated: true) { }
    }
    
    /// 收回键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.hideKeyBoard()
    }
    
    func hideKeyBoard() {
        
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}

extension UIViewController {
    
    /// Push 到新的VC, 如果这个VC是Navigation controller 的第二个 vc, 需要设置 hidesBottomBarWhenPushed 为true
    ///
    /// - Parameters:
    ///   - viewController: The view controller to push onto the stack. This object cannot be a tab bar controller. If the view controller is already on the navigation stack, this method throws an exception.
    ///   - animated: Specify true to animate the transition or false if you do not want the transition to be animated. You might specify false if you are setting up the navigation controller at launch time.
    func pushToViewController(_ viewController: UIViewController, animated: Bool = true) {
        
        if self.isKind(of: UINavigationController.self) {
            
            (self as! UINavigationController).pushViewController(viewController, animated: animated)
            viewController.hidesBottomBarWhenPushed = true;
            
            return
        }
        
        if self.slideMenuController()?.isLeftOpen() ?? false {
            self.slideMenuController()?.closeLeft()
            
            if let nvc = self.slideMenuController()?.mainViewController {
                
                nvc.pushToViewController(viewController, animated: animated)
            }
   
        }
        
        
        if self.navigationController?.viewControllers.count == 1 {
            
            viewController.hidesBottomBarWhenPushed = true;
        }
        
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    @objc func popViewController() -> UIViewController? {
        
        return self.navigationController?.popViewController(animated: true)
    }
    
    
    func checkUserWhetherLoggedIn() -> Bool {
        
        guard CacheHandler.shared.userLoggedIn else {
            
            jumpToLoginVC()
            
            return false
        }
        
        return true
        
    }
    
    
    /// 跳转至登录页
    func jumpToLoginVC() {
        
        let loginVC = XLoginVController()

        let navVC = BaseNaviViewController.init(rootViewController: loginVC)

        self.present(navVC, animated: true) {

        }
    }
    
    func jumpToRegisterVC() {
        
        //        let registerVC = RegisterViewController()
        //
        //        let navVC = BaseNaviViewController.init(rootViewController: registerVC)
        //
        //        self.present(navVC, animated: true, completion: nil)
        
    }
}




