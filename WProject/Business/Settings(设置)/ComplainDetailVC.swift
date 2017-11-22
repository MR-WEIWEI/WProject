//
//  ComplainDetailVC.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/12.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class ComplainDetailVC: BaseViewController {
    
    @IBOutlet weak var complainTypeLabel: UILabel!
    @IBOutlet weak var orderTypeLabel: UILabel!
    @IBOutlet weak var orderNumLabel: UILabel!
    @IBOutlet weak var complainContentLabel: UILabel!
    @IBOutlet weak var replyContentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "投诉详情"
        self.initSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        self.complainContentLabel.text = "一大段文字，背景大小适应高度。文本文本文本调试一大段文字，背景大小适应文本本调试一大段文字，背景大小适应文本文本文本调试"
        self.replyContentLabel.text = "一大段文字，背景大小适应高度。文本文本文本调试一大段文字，背景大小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试大小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试一大段文字，背景大小适应文本文本文本调试"
    }
    
}
