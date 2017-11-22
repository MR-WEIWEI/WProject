//
//  XLoginVController.swift
//  66FM
//
//  Created by WeiWei on 2017/10/24.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit

class XLoginVController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var areaNumTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var ensureBtn: UIButton!
    
    let userViewModel = UserViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "登录"

        self.initSubViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubViews() {
        
        self.phoneNumTextField.delegate = self
        self.phoneNumTextField.addTarget(self, action: #selector(textFieldValueChanged), for: .valueChanged)
    }
    
    @objc func textFieldValueChanged() {
        
        let newStr = self.phoneNumTextField.text!

        if (newStr.count) == 13 {
            
            self.changeEnsureBtnState(enable: true)
            
            let startSlicingIndex = newStr.index(newStr.startIndex, offsetBy: 13)
            let subvalues = newStr[newStr.startIndex..<startSlicingIndex] // One-sided Slicing
            self.phoneNumTextField.text = subvalues.description
            
            return
        }
        self.changeEnsureBtnState(enable: false)
    }
    
    // MARK: - textfieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldStr = textField.text
        var newStr = (oldStr as NSString?)?.replacingCharacters(in: range, with: string)
        if textField == self.phoneNumTextField {
            
            newStr = newStr?.replacingOccurrences(of: " ", with: "")
            
            let expression = "^([1]{1}([34578]{1}([0-9]{0,9}+)?)?)?$"
            let regex = try?NSRegularExpression.init(pattern: expression, options: .caseInsensitive)
            let numOfMatches = regex?.matches(in: newStr!, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, (newStr?.count)!))
            
            if numOfMatches?.count == 0 {
                
                return false
            }
            
            _ = self.formatPhoneNumText(textField: textField, range: range, string: string)
            
            return false
        }
        
        return true
    }
    
    private func formatPhoneNumText (textField:UITextField, range:NSRange, string:String) -> Bool {
        
        var text = textField.text!
        
        // 只能输入数字
        let characterSet = NSCharacterSet.init(charactersIn: "0123456789")
        
        let tempString = string.replacingOccurrences(of: " ", with: "")
        if (tempString.rangeOfCharacter(from: characterSet.inverted) != nil) {
            
            return false
        }
        
        text = ((text as NSString?)?.replacingCharacters(in: range, with: string))!
        text = text.replacingOccurrences(of: " ", with: "")
        
        text.insert(" ", at: (text.startIndex))
        var newString = ""
        
        while (text.count) > 0 {
            
            let subString = (text as NSString).substring(to: min(text.count, 4))
            newString = newString.appending(subString)
            if subString.count == 4 {
                
                newString = newString.appending(" ")
            }
            text = (text as NSString).substring(from: min(text.count, 4))
        }
        newString = newString.trimmingCharacters(in: characterSet.inverted)
        
        if newString.count >= 14 {
            
            return false
        }
        
        
        if range.location != textField.text?.count {
            
            textField.text = newString
            
            guard newString.count == 13 else {
                
                self.changeEnsureBtnState(enable: false)
                return false
            }
            self.changeEnsureBtnState(enable: true)
            
            return false
        }
        
        textField.text = newString
        
        guard newString.count == 13 else {
            
            self.changeEnsureBtnState(enable: false)
            return false
        }
        self.changeEnsureBtnState(enable: true)
        
        return false
    }
    
    func checkInputLength () -> Bool {
        
        if (self.phoneNumTextField.text?.count)! < 13 {
            
            Toast.show(title: "请输入有效的手机号码")
            
            return false
        }
        
        return true
    }
    
    func changeEnsureBtnState(enable: Bool) {
        
        if enable == true {
            
            self.ensureBtn.isUserInteractionEnabled = true
//            self.ensureBtn.setBackgroundImage(R.image.green_btn(), for: .normal)
//            self.ensureBtn.backgroundColor = UIColor.white
            self.ensureBtn.backgroundColor = UIColor(patternImage: R.image.green_btn()!)
            self.ensureBtn.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            self.ensureBtn.isUserInteractionEnabled = false
            self.ensureBtn.setBackgroundImage(UIImage(), for: .normal)
            self.ensureBtn.backgroundColor = UIColor(red: 227/255.0, green: 227/255.0, blue: 227/255.0, alpha: 1)
            self.ensureBtn.setTitleColor(UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        let registerVC = XSMSCodeVController()
        registerVC.phoneNumStr = self.phoneNumTextField.text?.replacingOccurrences(of: " ", with: "") ?? ""

        self.pushToViewController(registerVC)
//        self.loginRequest()
    }
    
}

extension XLoginVController {
    
    func loginRequest() {
        
        let param = ["mobileNo": self.phoneNumTextField.text?.replacingOccurrences(of: " ", with: "") ?? ""]
        
        self.userViewModel.login(param: param).then { (item) -> Void in
            
            }.catch { (error) in
                
        }
    }
}
