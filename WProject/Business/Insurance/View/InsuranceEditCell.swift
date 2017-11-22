//
//  InsuranceEditCell.swift
//  66FM
//
//  Created by WeiWei on 2017/11/2.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit

class InsuranceEditCell: UITableViewCell {
    
    @IBOutlet weak var addPersonBtn: UIButton!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    
    var addMoreBtnClickCloure: (() -> Void)?
    
    
    let dateFormatter: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        return dateFormatter
    }()
    
    let startTimePicker: UIDatePicker = {
       
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date.init(timeIntervalSinceReferenceDate: 0)
        datePicker.addTarget(self, action: #selector(startTimeChanged), for: .valueChanged)
        
        return datePicker
    }()
    
    let endTimePicker: UIDatePicker = {

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date.init(timeIntervalSinceReferenceDate: 0)
        datePicker.addTarget(self, action: #selector(endTimeChanged), for: .valueChanged)

        return datePicker
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initSubviews() {
        
        self.selectionStyle = .none
        
        self.startTimeTextField.inputView = self.startTimePicker
        self.endTimeTextField.inputView = self.endTimePicker
    }
    
    @objc func startTimeChanged(datePicker: UIDatePicker) {
        
        let dateStr = self.dateFormatter.string(from: self.startTimePicker.date)
        self.startTimeTextField.text = dateStr
    }
    
    @objc func endTimeChanged() {

        let dateStr = self.dateFormatter.string(from: self.endTimePicker.date)
        self.endTimeTextField.text = dateStr
    }
    
    @IBAction func addPersonBtnClicked(_ sender: Any) {
        
        self.addMoreBtnClickCloure?()
    }
}
