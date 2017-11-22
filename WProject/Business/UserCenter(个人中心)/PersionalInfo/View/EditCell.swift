//
//  EditCell.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/10.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class EditCellModel: NSObject {
    
    var title = String()
    var type = EditCellType.input
    var dataArr = [String]()
    var hasDetail: Bool = false
    var tag: Int = 0
}

enum EditCellType {
    case input
    case selectNormal
    case selectTime
    case jump
}

class EditCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rightArrowImgView: UIImageView!
    
    var model = EditCellModel()
    
    var valueChangedClosure: ((_ newValue: String) -> Void)?
    var willJumpClosure: ((_ tag: Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setView(model: EditCellModel) {
        
        self.model = model
        
        self.titleLable.text = model.title
        self.textField.delegate = self
        
        self.rightArrowImgView.isHidden = !model.hasDetail
        
        self.textField.tag = model.tag
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        guard self.model.type != .input else {
            
            return true
        }
        
        guard self.model.tag == 0 else {
            
            self.willJumpClosure?(self.model.tag)
            return false
        }
        
        self.superview?.endEditing(true)
        
        if self.model.type == .selectNormal {
            let normalPicker = WPicker.creatPicker(type: .normal, dataArr: model.dataArr)
            
            normalPicker.ensureBtnClickedNormalClosure = { [weak self] index in
                
                guard self?.model.dataArr.count != 0 else {
                    
                    return
                }
                
                self?.textField.text = self?.model.dataArr[index]
                
                self?.valueChangedClosure?((self?.textField.text)!)
            }
        }
        else if self.model.type == .selectTime {
            
            let timePicker = WPicker.creatPicker(type: .time)
            
            timePicker.ensureBtnClickedTimeClosure = { [weak self] dateStr in
                
                self?.textField.text = dateStr
                self?.valueChangedClosure?((self?.textField.text)!)
            }
        }
        
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var str = textField.text ?? ""
        str.replaceSubrange(Range.init(range, in: self.textField.text!)!, with: string)
        
        textField.text = str
        
        self.valueChangedClosure?(str)
        
        return false
    }
}
