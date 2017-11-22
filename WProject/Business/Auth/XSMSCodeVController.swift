//
//  XSMSCodeVController.swift
//  66FM
//
//  Created by WeiWei on 2017/10/24.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit

class XSMSCodeVController: BaseViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    /// 电话号码
    var phoneNumStr = String()
    /// 选中类型
    var selectedType = String()
    
    var itemArr = Array<RetrieveCodeModel>()
    
    var pickerView = UIPickerView(frame: CGRect(x: 0, y: screenHeight - 264, width: screenWidth, height: 200))
    
    let arr = ["1","2","3"]
    
    let userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "注册"
        
        self.initSubviews()
//        self.retrieveCodeList()
        // Do any additional setup after loading the view.
        
        self.registerRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.backgroundColor = UIColor.gray
    }
    
    @IBAction func typeBtnClicked(_ sender: UIButton) {
        
        // tag 100~103
        
        switch sender.tag {
        case 101:
            print("101")
            self.view.addSubview(self.pickerView)
        default:
            return
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.hideKeyBoard()
        self.pickerView.removeFromSuperview()
    }
}

extension XSMSCodeVController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.arr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}

extension XSMSCodeVController {

    
    func registerRequest() {
        
//        selfmobileNo    用户手机号    是    [string]
//        2    userType    用户类型，对应code表的user_type：业主，装饰公司，项目经理，材料商，工人，设计师，质检员    是    [string]
        
        let param = ["mobileNo": self.phoneNumStr, "userType": CacheHandler.shared.typeList(with: USER_TYPE)[0].codeValue ?? ""]
        
        self.userViewModel.userRegister(param: param).then { (item) -> Void in
            
            
        }
    }
}
