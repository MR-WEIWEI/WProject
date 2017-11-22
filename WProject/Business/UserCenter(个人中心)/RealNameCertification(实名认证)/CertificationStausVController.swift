//
//  CertificationStausVController.swift
//  XianMuShu
//
//  Created by pandaApe on 01/11/2017.
//  Copyright © 2017 pandaApe. All rights reserved.
//

import UIKit

class CertificationStausVController: BaseViewController {

    @IBOutlet weak var failuerCons: NSLayoutConstraint!
    @IBOutlet weak var passCons: NSLayoutConstraint!
    @IBOutlet weak var inProgressCons: NSLayoutConstraint!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var nameContentLbl: UITextField!
    
    @IBOutlet weak var numberLbl: UILabel!
    
    @IBOutlet weak var numberContentLbl: UITextField!
    
    @IBAction func recertificateBtnClicked(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "实名认证"
        
        self.failuerCons.constant = 0
        self.inProgressCons.constant = 0
        self.view.layoutIfNeeded()
    }
    
    
}
