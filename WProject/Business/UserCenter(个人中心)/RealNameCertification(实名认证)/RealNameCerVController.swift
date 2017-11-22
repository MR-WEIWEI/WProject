//
//  RealNameCerVController.swift
//  XianMuShu
//
//  Created by pandaApe on 01/11/2017.
//  Copyright © 2017 pandaApe. All rights reserved.
//

import UIKit

class RealNameCerVController: BaseViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var numberLbl: UILabel!
    
    @IBOutlet weak var numberTxtField: UITextField!
    
    @IBOutlet weak var cardFrontImgView: UIImageView!
    
    @IBOutlet weak var cardBackImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "实名认证"
        
        
    }
    
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        
    }
}
