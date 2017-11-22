//
//  PersionalInfoVC.swift
//  WProject
//
//  Created by WeiWei on 2017/11/15.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

let PersonalTagBirthAddress = 1001 // 出生地tag
let PersonalTagLiveAddress = 1002 // 居住地tag
let PersonalTagDeliveryAddress = 1003 // 收货地址

class PersionalInfoVC: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArr = [(String,Bool)]()
    var modelArr = [EditCellModel]()
    
    let userTypeArr = CacheHandler.shared.typeList(with: USER_TYPE)
    let workTypeArr = CacheHandler.shared.typeList(with: WORK_TYPE)
    
    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "编辑资料"
        self.initData()
        self.initSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        (self.tableView.viewWithTag(PersonalTagDeliveryAddress) as! UITextField).text = CacheHandler.shared.currentUser?.liveAddrDetail
    }
    
    func initSubviews() {
        
        self.headerImgView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectPhotoFromLib))
        self.headerImgView.addGestureRecognizer(tap)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 55
        self.tableView.register(R.nib.editCell(), forCellReuseIdentifier: R.nib.editCell.identifier)
        self.tableView.separatorStyle = .none
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.modelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.editCell.identifier) as! EditCell
        
        cell.setView(model: self.modelArr[indexPath.row])
        cell.valueChangedClosure = { [weak self] newValue in
            
//            print(newValue)
            self?.saveData()
        }
        
        cell.willJumpClosure = { [weak self] tag in
            
            if tag == PersonalTagBirthAddress || tag == PersonalTagLiveAddress {
                
                let areaSelectVC = AreaSelectVC()
                areaSelectVC.tag = tag
                
                self?.pushToViewController(areaSelectVC)
            }
            else if tag == PersonalTagDeliveryAddress {
                
                self?.pushToViewController(AddrListVController())
            }
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.view.endEditing(true)
    }
}

extension PersionalInfoVC {
    
    func initData() {
        
        self.dataArr = [("昵称",false),("性别",true),("年龄",false),("出生地",true),("居住地",true),("经验年数",false),("支付类型",true),("支付账号",false),("用户类型",true),("工种",true),("报价",false),("收货地址",true)]
        
        // 用户类型
        var userTypeDataArr = [String]()
        
        for typeItem in userTypeArr {
            
            userTypeDataArr.append(typeItem.codeValueDesc!)
        }
        
        // 工种
        var workTypeDataArr = [String]()
        
        for typeItem in workTypeArr {
            
            workTypeDataArr.append(typeItem.codeValueDesc!)
        }
        
        for (title, hasDetail) in self.dataArr {
            
            let publicModel = EditCellModel()
            publicModel.title = title
            publicModel.hasDetail = hasDetail
            
            switch title {
                
            case "性别":
                publicModel.type = .selectNormal
                publicModel.dataArr = ["男","女"]
            case "出生地":
                publicModel.type = .jump
                publicModel.tag = PersonalTagBirthAddress
            case "居住地":
                publicModel.type = .jump
                publicModel.tag = PersonalTagLiveAddress
            case "支付类型":
                publicModel.type = .selectNormal
                publicModel.dataArr = ["支付宝","微信"]
            case "用户类型":
                publicModel.type = .selectNormal
                publicModel.dataArr = userTypeDataArr
            case "工种":
                publicModel.type = .selectNormal
                publicModel.dataArr = workTypeDataArr
            case "收货地址":
                publicModel.type = .jump
                publicModel.tag = PersonalTagDeliveryAddress
            default:
                break
            }
            
            self.modelArr.append(publicModel)
        }
    }
}

extension PersionalInfoVC: UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    //选取相册
    @objc func selectPhotoFromLib () {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //设置是否允许编辑
            picker.allowsEditing = true
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
        
    }
    
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        
        //显示的图片
        let image:UIImage!
//        if editSwitch.isOn {
            //获取编辑后的图片
            image = info[UIImagePickerControllerEditedImage] as! UIImage
//        }else{
//            //获取选择的原图
//            image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        }
        
        self.headerImgView.image = image
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
}

extension PersionalInfoVC {
    
    func saveData() {
        
    }
}

