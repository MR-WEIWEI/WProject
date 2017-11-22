//
//  XmsTimePikcer.swift
//  XianMuShu
//
//  Created by pandaApe on 29/10/2017.
//  Copyright © 2017 pandaApe. All rights reserved.
//

import UIKit

@objc
protocol XmsTimePikcerDelegate {
    
    @objc optional func xmsTimePicker(_ xmsTimePicker:XmsTimePikcer, cancelSelection lastDate:Date)
    
    @objc optional func xmsTimePicker(_ xmsTimePicker:XmsTimePikcer, selected date:Date)
    
}

class XmsTimePikcer: UIView {
    
    weak var delegate: XmsTimePikcerDelegate?
    
    @IBOutlet weak var viewBottomCons: NSLayoutConstraint!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var pickerContainerView: UIView!
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        
        self.delegate?.xmsTimePicker?(self, cancelSelection: timePicker.date)
        
        self.hide()
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
        
        self.delegate?.xmsTimePicker?(self, selected: timePicker.date)
        self.hide()
    }
    
    func show(date: Date?) {
        
        let currentWindow   = UIApplication.shared.keyWindow!
        self.frame          = currentWindow.bounds
        
        currentWindow.addSubview(self)
        
        self.alpha          = 1
        self.timePicker.minimumDate = Date()
        self.timePicker.setDate(date ?? Date(), animated: false)
        
        viewBottomCons.constant = -250;
        self.layoutIfNeeded()
        
        viewBottomCons.constant = 0;
        
        UIView.animate(withDuration: 0.2) {
            
            self.layoutIfNeeded()
        }
    }
    
    func hide() {
        
        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            
            self.alpha = 0
        }) { (com) in
            
            self.removeFromSuperview()
            
        }
    }
    
    
    
}
