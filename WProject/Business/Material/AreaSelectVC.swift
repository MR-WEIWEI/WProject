//
//  AreaSelectVC.swift
//  XianMuShu
//
//  Created by WeiWei on 2017/11/7.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class AreaSelectVC: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var provinceTableView: UITableView!
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var districtTableView: UITableView!
    
    public var tag: Int = 0
    
    var selectedProvence = String()
    var selectedCity = String()
    var selectedDistrict = String()
    
    var selectedAddress = String()
    
    var cityModelArr = [AreaModel]()
    var districtModelArr = [AreaModel]()
    
    lazy var provinceModelArr: [AreaModel] = {

        //1 获取json文件路径
        let path=Bundle.main.path(forResource: "cityCode", ofType: "json")
        //2 获取json文件里面的内容,NSData格式
        //        let jsonData=NSData(contentsOfFile: path!)
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!))

        let json = try! JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String: Any]]

        var tempArr = [AreaModel]()
        for dict in json {

            let model = AreaModel.deserialize(from: dict)
            tempArr.append(model!)
        }
        return tempArr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "选择地区"
        self.initSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        let rightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        rightBtn.contentHorizontalAlignment = .right
        rightBtn.setTitle("完成", for: .normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        rightBtn.setTitleColor(UIColor.black, for: .normal)
        rightBtn.addTarget(self, action: #selector(ensureBtnClicked), for: .touchUpInside)
        
        let rightItem = UIBarButtonItem(customView: rightBtn)
        self.navigationItem.setRightBarButton(rightItem, animated: true)
        
        self.provinceTableView.dataSource = self
        self.cityTableView.dataSource = self
        self.districtTableView.dataSource = self
        
        self.provinceTableView.delegate = self
        self.cityTableView.delegate = self
        self.districtTableView.delegate = self
        
        self.provinceTableView.rowHeight = 44
        self.cityTableView.rowHeight = 44
        self.districtTableView.rowHeight = 44
        
        self.provinceTableView.register(R.nib.areaCell(), forCellReuseIdentifier: R.nib.areaCell.identifier)
        self.cityTableView.register(R.nib.areaCell(), forCellReuseIdentifier: R.nib.areaCell.identifier)
        self.districtTableView.register(R.nib.areaCell(), forCellReuseIdentifier: R.nib.areaCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case self.provinceTableView:
            return self.provinceModelArr.count
        case self.cityTableView:
            return self.cityModelArr.count
        case self.districtTableView:
            return self.districtModelArr.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.areaCell.identifier) as! AreaCell
        
        switch tableView {
        case self.provinceTableView:
            cell.titleLabel?.text = self.provinceModelArr[indexPath.row].name
        case self.cityTableView:
            cell.titleLabel?.text = self.cityModelArr[indexPath.row].name
        case self.districtTableView:
            cell.titleLabel?.text = self.districtModelArr[indexPath.row].name
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView {
        case self.provinceTableView:
            self.provinceSelected(index: indexPath.row)
        case self.cityTableView:
            self.citySelected(index: indexPath.row)
        case self.districtTableView:
            self.districtSelected(index: indexPath.row)
        default:
            break
        }
    }
    
    func provinceSelected(index: Int) {
        
        //
        
        self.selectedDistrict = ""
        self.selectedCity = ""
        
        self.selectedProvence = self.provinceModelArr[index].name
        
        self.cityModelArr = self.provinceModelArr[index].nodes
        self.cityTableView.reloadData()
        
        self.districtModelArr = [AreaModel]()
        self.districtTableView.reloadData()
    }
    
    func citySelected(index: Int) {
        
        //
        self.selectedDistrict = ""
        
        self.selectedCity = self.cityModelArr[index].name
        
        self.districtModelArr = self.cityModelArr[index].nodes
        self.districtTableView.reloadData()
    }
    
    func districtSelected(index: Int) {
        
        //
        print(self.districtModelArr[index].name)
        self.selectedDistrict = self.districtModelArr[index].name
    }
    
    @objc func ensureBtnClicked() {
        
        guard self.selectedDistrict.count > 0 else {
            
            Toast.show(title: "请选择完整")
            return
        }
        
        self.selectedAddress = "\(self.selectedProvence) \(self.selectedCity) \(self.selectedDistrict)"
        
        if self.tag == PersonalTagBirthAddress || self.tag == PersonalTagLiveAddress {
            
            let index = self.navigationController?.viewControllers.count
            
            let personalInfoVC = self.navigationController?.viewControllers[index! - 2] as! PersionalInfoVC
            
            (personalInfoVC.tableView.viewWithTag(self.tag) as! UITextField).text = self.selectedAddress
//            (personalInfoVC?.view.viewWithTag(self.tag) as! UITextField).text = self.selectedAddress
        }
        
        _ = self.popViewController()
    }
}
