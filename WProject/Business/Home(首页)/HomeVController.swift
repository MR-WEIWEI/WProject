//
//  HomeVController.swift
//  ShareCraftsman
//
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit
import Moya
import RxSwift


class HomeVController: BaseViewController, XmsTimePikcerDelegate{
    
    @IBOutlet weak var workSelectBtn: UIButton!
    @IBOutlet weak var startDateBtn: UIButton!
    @IBOutlet weak var endDateBtn: UIButton!
    @IBOutlet weak var locationBtn: UIButton!
    
    let appDataInitVModel = AppDataInitVModel()

    let timePickerView = R.nib.xmsTimePikcer.firstView(owner: nil)!
    
    var projOrder = ProjOrder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "锨木鼠"
        
        self.timePickerView.delegate = self
        
        let btnItem         = UIBarButtonItem(image: R.image.navIconUser(), style: UIBarButtonItemStyle.plain, target: self, action: #selector(openLeftMenu))
        btnItem.tintColor   = UIColor.gray
        
        self.navigationItem.setLeftBarButton(btnItem, animated: false)
        
        appDataInitVModel.retrieveCodeList()
        
        
    }
 
}

// MARK: BTN Actions
extension HomeVController {
    
    @objc
    func openLeftMenu() {
        
        self.slideMenuController()?.openLeft()
    }
    
    @IBAction func startTimeBtnClicked(_ sender: Any) {
        
        self.timePickerView.tag = 101
        timePickerView.show(date: self.projOrder.startDate)
    }
    
    @IBAction func endTimeBtnClicked(_ sender: Any) {
        
        
        self.timePickerView.tag = 102
        timePickerView.show(date: self.projOrder.endDate)
    }
    
    @IBAction func designBtnClicked(_ sender: UIButton) {
        
        //        self.pushViewController(XSMSCodeVController())
        self.pushToViewController(DesignerListVController())
    }
    
    @IBAction func directOrderBtnClicked(_ sender: Any) {
        
        self.pushToViewController(CertificationStausVController())
    }
    @IBAction func butInsuranceBtnClicked(_ sender: Any) {
        self.pushToViewController(InsuranceVC())
        //        self.present(XSMSCodeVController(), animated: true, completion: nil)
    }
    
    @IBAction func jumpToMaterialBtnClicked(_ sender: Any) {
        
        self.pushToViewController(MaterialVC())
    }
    
    @IBAction func findProjBtnClicked(_ sender: Any) {
        
        self.pushToViewController(PublicProjectVC())
    }
    
    @IBAction func projOrderBtnClicked(_ sender: UIButton) {
        
        guard let _ = self.projOrder.workerType else {
            
            Toast.show(title: "请选择工人类型")
            return
        }
        
        guard let _ = self.projOrder.startDate else {
            
            Toast.show(title: "请选择项目开始时间")
            return
        }
        
        guard let _ = self.projOrder.endDate else {
            
            Toast.show(title: "请选择项目结束时间")
            
            return
        }
        
        guard self.projOrder.endDate!.timeIntervalSince1970 > self.projOrder.startDate!.timeIntervalSince1970 else {
            
            Toast.show(title: "项目开始时间应早于结束时间")
            return
        }
        
        guard let _ = self.projOrder.addressCode else {
            
            Toast.show(title: "请选择项目地点")
            return
        }
        
        guard let _ = self.projOrder.workerCount else {
            
            Toast.show(title: "请输入项目所需工人类型的人数")
            return
        }
        
        guard let _ = self.projOrder.projectPrice else {
            
            Toast.show(title: "请输入项目费用")
            return
        }
    }
}

// MARK: Delegate
extension HomeVController {
    
    func xmsTimePicker(_ xmsTimePicker:XmsTimePikcer, selected date:Date) {
        
        let df = DateFormatter()
        
        df.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateFormatString = df.string(from: date)
        
        
        if xmsTimePicker.tag == 101 {
            
            self.projOrder.startDate    = date
            self.startDateBtn.setTitle( dateFormatString, for: .normal)
        }else{
            
            self.projOrder.endDate      = date
            self.endDateBtn.setTitle( dateFormatString, for: .normal)
        }
    }
    
}


extension HomeVController {

        func retrieveCodeList() {
            
            self.appDataInitVModel.retrieveCodeList().then { (items) -> Void in
    
    
                }.catch { (error) in
    

            }
        }
    
    
}

