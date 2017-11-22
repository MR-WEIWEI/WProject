//
//  AddMorePersonCell.swift
//  WPay
//
//  Created by WeiWei on 2017/10/30.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class AddMorePersonCell: UITableViewCell, UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cardNumTextField: UITextField!
    
    let dataArr = ["身份证","身份证","身份证","身份证","身份证"]
    
    lazy var cardTypePicker: UIPickerView = {
        
        let pickerView = UIPickerView()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        return pickerView
    }()
    
    lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker()
        
        //UIDatePicker时间范围限制
        let maxDate = Date(timeIntervalSinceNow: 0)
        datePicker.maximumDate = maxDate
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        return datePicker
    }()
    
    var model = PersonModel()
    
    public var checkViewDataClosure: ((_ model: PersonModel)->Void)?
    
    // MARK:-
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.initSubviews()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initSubviews() {
        
        self.nameTextField.delegate = self
        self.cardNumTextField.delegate = self
    }
    
    func setViewWithModel(model: PersonModel) {
        
        self.model = model
        
        self.nameTextField.text     = model.name
        self.cardNumTextField.text  = model.cardNumStr
    }
}

extension AddMorePersonCell {
    
    // MARK:- textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldStr = textField.text
        var newStr = (oldStr as NSString?)?.replacingCharacters(in: range, with: string)
        if textField == self.cardNumTextField {
            
            newStr = newStr?.replacingOccurrences(of: " ", with: "")
        }
        
        return true
    }
    
    func checkViewData() -> Bool {
        
        if (self.nameTextField.text?.count)! == 0 {

            Toast.show(title: "请输入姓名")
            return false
        }
        else if (self.nameTextField.text?.count)! < 2 {
            
            Toast.show(title: "请输入正确的姓名")
            return false
        }
        
        if self.cardNumTextField.text?.count == 0 {
            
            Toast.show(title: "请输入身份证号")
            return false
        }
        
        let expression = "(\\d{14}|\\d{17})(\\d|[xX])$"
        let regex = try?NSRegularExpression.init(pattern: expression, options: .caseInsensitive)
        let numOfMatches = regex?.matches(in: self.cardNumTextField.text ?? "", options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, ((self.cardNumTextField.text ?? "")?.count)!))
        
        if numOfMatches?.count == 0 {
            
            Toast.show(title: "请输入有效的身份证号")
            return false
        }
        
        // check success
        self.model.name         = self.nameTextField.text!
        self.model.cardNumStr   = self.cardNumTextField.text!
        
        self.checkViewDataClosure?(self.model)
        
        return true
    }
}

extension AddMorePersonCell {
    
    // MARK:- pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.dataArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    // MARK:- date picker
    
    @objc func dateChanged() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        let dateStr = dateFormatter.string(from: self.datePicker.date)
        
//        self.birthTextField.text = dateStr
    }
}
