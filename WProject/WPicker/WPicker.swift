//
//  WPicker.swift
//  WPay
//
//  Created by WeiWei on 2017/11/8.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

enum PickerType {
    case normal
    case date
    case time
}

class PickerModel: NSObject {
    
    var name = String()
}

class WPicker: UIView {
    
    
    var dataArr = [String]()
    var picker: WPicker!
    
    var pickerType = PickerType.normal
    
    
    var selectedModel = PickerModel()
    var selectedIndex: Int = 0
    
    fileprivate var normalPicker = UIPickerView()
    fileprivate var datePicker = UIDatePicker()
    
    var ensureBtnClickedNormalClosure: ((_ index: Int) -> Void)?
    var ensureBtnClickedTimeClosure: ((_ timeStr: String) -> Void)?

    class func creatPicker(type: PickerType, dataArr: [String] = [String]()) -> WPicker {
        
        let wPicker = WPicker()
        wPicker.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        wPicker.frame = (UIApplication.shared.keyWindow?.frame)!
        UIApplication.shared.keyWindow?.addSubview(wPicker)
        
        wPicker.pickerType = type
        wPicker.dataArr = dataArr
        
        wPicker.initSubviews()
        
        switch type {
        case .normal:
            wPicker.createNormalPicker(dataArr: dataArr)
        case .date:
            wPicker.createDatePicker()
        case .time:
            wPicker.createDatePicker()
        }
        
        return wPicker
    }
    
    func initSubviews() {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: screenHeight-215-40, width: screenWidth, height: 40))
        toolBar.backgroundColor = UIColor.white
        self.addSubview(toolBar)
        
        let leftItem = UIBarButtonItem(title: "  取消", style: .plain, target: self, action: #selector(hide))
        leftItem.tintColor = UIColor.black
        let rightItem = UIBarButtonItem(title: "确定  ", style: .plain, target: self, action: #selector(ensure))
        rightItem.tintColor = UIColor.black
        let flexItem1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolBar.items = [leftItem,flexItem1,rightItem]
    }
    
    @objc func hide() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
        }) { (complete) in
            self.removeFromSuperview()
        }
    }
    
    @objc func ensure() {
        
        self.hide()
        
        if pickerType == .date || pickerType == .time {
            
            var dateStr = String()
            let dateFormatter = DateFormatter()
            
            if pickerType == .date {
                dateFormatter.dateFormat = "YYYY-MM-dd"
            }
            else{
                dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
            }
            
            dateStr = dateFormatter.string(from: self.datePicker.date)
            
            self.selectedModel.name = dateStr
//            self.selectedModel.id = "0"
            self.ensureBtnClickedTimeClosure?(dateStr)
        }
        else {
            
            self.ensureBtnClickedNormalClosure?(self.selectedIndex)
        }
    }
}

extension WPicker: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK:- normalPicker
    func createNormalPicker(dataArr: [String]) {
        
        normalPicker.frame = CGRect(x: 0, y: screenHeight - 215, width: screenWidth, height: 215)
        normalPicker.backgroundColor = UIColor.white
        
        normalPicker.dataSource = self
        normalPicker.delegate = self
        
        self.addSubview(normalPicker)
    }
    
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
        
        self.selectedIndex = row
    }
}

extension WPicker {
    
    // MARK:- datePicker
    func createDatePicker() {
        
        datePicker.frame = CGRect(x: 0, y: screenHeight - 215, width: screenWidth, height: 215)
        if self.pickerType == .date {
            datePicker.datePickerMode = .date
        }
        else if self.pickerType == .time {
            datePicker.datePickerMode = .dateAndTime
        }
        
        datePicker.backgroundColor = UIColor.white
        
        self.addSubview(datePicker)
    }
}
