//
//  HLPCTextField.swift
//  HLPCTextField
//
//  Created by PandaApe on 27/07/2017.
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit

//@IBDesignable
public class HLPWTextField: UIView {
    
    public var passwordText: String {
        
        set{
            textField.text = newValue
        }
        
        get{
            
            return textField.text ?? ""
        }
    }
    
    public var passwordChangedClosure: ((_ passwordText: String, _ pwTextField: HLPWTextField)->Void)?
    public var passwordDidBeginEditClosure: (()->Void)?
    
    /// 密码长度
//    @IBInspectable
    public var passwordLength: Int       = 6 {
        
        didSet{
            
            pwLabels.removeAll()
            dashLabels.removeAll()
            
            for _ in 0..<passwordLength {
                
                let pwLabel     = UILabel()
                let dashLabel   = UILabel()
                
                pwLabels.append(pwLabel)
                dashLabels.append(dashLabel)
                
            }
            
            layoutSubviews()
        }
    }
    
    
    /// 密码显示文字颜色
//    @IBInspectable
    public var passwordColor: UIColor    = UIColor(white: 102/255, alpha: 1) {
        
        didSet{
            layoutSubviews()
        }
    }
    
    /// 密码字体大小
//    @IBInspectable
    public var fontSize: CGFloat         = 7 {
        
        didSet{
            layoutSubviews()
        }
    }
    
    // 已输入，下划线颜色
//    @IBInspectable
    public var dashTrackColor: UIColor   = UIColor(red: 205/255.0, green: 172/255.0, blue: 110/255.0, alpha: 1) {
        
        didSet{
            layoutSubviews()
        }
    }
    
    /// 未输入，下划线颜色
//    @IBInspectable
    public var dashColor: UIColor        = UIColor(white: 227/255, alpha: 1) {
        
        didSet{
            layoutSubviews()
        }
    }
    
    /// 下划线间距
//    @IBInspectable
    public var dashGapWidth: CGFloat     = 15 {
        
        didSet{
            layoutSubviews()
        }
    }
    
    /// 下划线和密码间距
//    @IBInspectable
    public var dashVerticalMargin: CGFloat = 15 {
        
        didSet{
            layoutSubviews()
        }
    }
    
    /// 下划线高度
//    @IBInspectable
    public var dashHeight: CGFloat       = 2 {
        
        didSet{
            layoutSubviews()
        }
    }
    
    /// 键盘类型
    public var keyboardType: UIKeyboardType             = .numberPad {
        
        willSet {
            
            textField.keyboardType  = newValue
        }
    }
    
    public let textField   = UITextField()
    fileprivate var pwLabels    = [UILabel]()
    fileprivate var dashLabels  = [UILabel]()
    
    @objc private func passcodeChanged(_ tf: UITextField) {
        
        let password        = textField.text!
        let currentpwLength = textField.text!.count
        
        guard passwordLength >= currentpwLength else {
            
            let endSlicingIndex = password.index(password.startIndex, offsetBy: passwordLength)

            tf.text = String(password[...endSlicingIndex])
            return
        }
        
        for (i, pwLabel) in pwLabels.enumerated() {
            
            let dashLabel = dashLabels[i]
            
            if i < currentpwLength {
                
                pwLabel.text                = "●"
            }else{
                
                pwLabel.text                = ""
            }
            
            dashLabel.backgroundColor   = dashColor

        }
        
        if currentpwLength >= 1 {
            
            let currentDashLabel                = dashLabels[currentpwLength-1]
            currentDashLabel.backgroundColor    = dashTrackColor
        }
 
        self.passwordChangedClosure?(password, self)
    }
    
    @objc private func passcodeDidBeginEdit(_ tf: UITextField) {
        
        if (self.passwordDidBeginEditClosure != nil) {
            self.passwordDidBeginEditClosure!()
        }
    }
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        textField.frame         = self.bounds
        textField.isHidden      = true
        textField.keyboardType  = keyboardType
        
        textField.addTarget(self, action: #selector(passcodeChanged(_:)), for: .editingChanged)
        textField.addTarget(self, action: #selector(passcodeDidBeginEdit(_:)), for: .editingDidBegin)
        addSubview(textField)
        
        passwordLength          = 6
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let width       = bounds.size.width
        let height      = bounds.size.height
        
        let itemWidth  = width/CGFloat(passwordLength)
        
        for (index, pwLabel) in pwLabels.enumerated() {
            
            pwLabel.font        = UIFont.systemFont(ofSize: fontSize)
            pwLabel.textColor   = passwordColor
            pwLabel.textAlignment = .center
            pwLabel.frame       = CGRect(x: CGFloat(index)*itemWidth, y: 0, width: itemWidth, height: height)
            
            if pwLabel.superview == nil{
                
                addSubview(pwLabel)
            }
            
            let dashLabel       = dashLabels[index]
            dashLabel.frame     = CGRect(x: CGFloat(index)*itemWidth+dashGapWidth/2, y: (height+fontSize)/2+dashVerticalMargin, width: itemWidth-dashGapWidth, height: dashHeight)
            
            if dashLabel.superview == nil{
                
                addSubview(dashLabel)
            }
        }
        
        self.passcodeChanged(textField)
    }
    
    public func clear() {
        
        textField.text = ""
        self.passcodeChanged(textField)
    }
    
    public func showKeyboard() {
        
        textField.becomeFirstResponder()
    }
    
    public func hideKeyboard() {
        
        textField.resignFirstResponder()
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        showKeyboard()
    }
    
}
