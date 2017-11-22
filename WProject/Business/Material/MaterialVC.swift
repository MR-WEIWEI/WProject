//
//  MaterialVC.swift
//  WPay
//
//  Created by Weiwei on 2017/11/2.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialVC: BaseViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var brandBtn: UIButton!
    @IBOutlet weak var materialTypeBtn: UIButton!
    @IBOutlet weak var areaBtn: UIButton!
    
    @IBOutlet weak var materialTypeTextField: UITextField!
    
    var selectedMaterialType = String()
    var selectedBrand = String()
    var selectedArea = String()
    
    
    let dataArr = ["材料类型1","材料类型2","材料类型3","材料类型4","材料类型5"]
    lazy var materialTypePicker: UIPickerView = {
        
        let pickerView = UIPickerView()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        return pickerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "材料包"
        self.initSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 70
        
        self.tableView.register(R.nib.materialListCell(), forCellReuseIdentifier: R.nib.materialListCell.identifier)
        
        self.materialTypeTextField.inputView = self.materialTypePicker
        self.materialTypeTextField.tintColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.materialListCell.identifier) as! MaterialListCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(MaterialSelectVC(), animated: true)
    }
    
    @IBAction func brandBtnClicked(_ sender: Any) {
        
        self.navigationController?.pushViewController(MaterialBrandVC(), animated: true)
    }
    
    @IBAction func materialBtnClicked(_ sender: Any) {
    }
    
    @IBAction func areaBtnClicked(_ sender: Any) {
        
        self.pushToViewController(AreaSelectVC())
    }
    
}

extension MaterialVC {
    
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
        
//        self.cardTypeTextField.text = self.dataArr[row]
        self.materialTypeBtn.setTitle(self.dataArr[row], for: .normal)
        self.selectedMaterialType = self.dataArr[row]
    }
}
