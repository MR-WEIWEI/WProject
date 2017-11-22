//
//  DropSelectView.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/10/28.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit

class DropSelectView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // MARK:-
    
    public var changeOpenStatus: ((_ isOpen: Bool)->Void)?
    
    @IBInspectable var numberOfItems: Int = 1
    @IBInspectable var itemTitle: Array<String> = []
    
    var viewArr = Array<DropSelectItemView>()
    
    var dataArr = Array<DropSelectModel>()
    private var tableView = UITableView()
    
    var currentIndex = 0
    var selectedArr = Array<DropSelectModel>()
    
    var viewFrame = CGRect()
    var isOpen: Bool = false
    
    public var selectedClosure: ((_ selectedArr: [DropSelectModel])->Void)?
    
    // MARK:-

    override func awakeFromNib() {
        
        self.initData()
        self.initSubviews()
        
        self.viewFrame = self.frame
        
        self.tableView.isHidden = true
        self.addSubview(self.tableView)
        
        let height = self.frame.height
        
        for i in 0...self.numberOfItems-1 {
            
            self.selectedArr.append(DropSelectModel())
            
            let itemWidth = screenWidth/CGFloat(self.numberOfItems)
            let itemHeight = height
            
            let itemX = CGFloat(i) * itemWidth
            let itemY = CGFloat(0)
            
            let dropItemView = DropSelectItemView.addToView(view: self, frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: itemHeight))
            
            dropItemView.index = i
            
            dropItemView.dataArr = self.dataArr
            
            dropItemView.changeIndexClosure = {[weak self] (index,isOpen) in
                
                guard isOpen else {
                    self?.hideTableView()
                    return
                }
                self?.showTableView(index: index, dataAarr: dropItemView.dataArr)
            }
            
            self.viewArr.append(dropItemView)
        }
    }
    
    func initData() {
        
        let arr = [["name":"1","id":"1"],["name":"2","id":"2"],["name":"3","id":"3"],["name":"4","id":"4"],["name":"5","id":"5"]]
        
        for dict in arr {
            
            let model = DropSelectModel.deserialize(from: dict)
            self.dataArr.append(model!)
        }
        
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isUserInteractionEnabled = true
        
        self.tableView.register(R.nib.dropSelectCell(), forCellReuseIdentifier: R.nib.dropSelectCell.identifier)
        
        self.tableView.sectionFooterHeight = 0
        self.tableView.tableFooterView = UIView()
        
//        self.tableView.backgroundColor = UIColor.red
    }
    
    func showTableView(index: Int, dataAarr: Array<DropSelectModel>) {
        
        self.changeOpenStatus?(true)
        
        for itemView in self.viewArr {
            
            itemView.isOpen = false
        }
        self.viewArr[index].isOpen = true
        
        let viewFrame = self.viewFrame
        
        let tableViewX = viewFrame.width/CGFloat(self.numberOfItems) * CGFloat(index)
        let tableViweY = viewFrame.height
        let tableViewWidth = viewFrame.width/CGFloat(self.numberOfItems)
        
        self.tableView.frame = CGRect(x: tableViewX, y: tableViweY, width: tableViewWidth, height: 150)
        self.frame = CGRect(x: viewFrame.minX, y: viewFrame.minY, width: viewFrame.width, height: screenHeight)
        
        self.currentIndex = index
        
        self.dataArr = dataAarr
        self.tableView.reloadData()
        
        self.tableView.isHidden = false
        self.bringSubview(toFront: self.tableView)
    }
    
    @objc func hideTableView() {
        
        let itemView = self.viewArr[self.currentIndex]
        itemView.isOpen = false
        
        self.tableView.isHidden = true
        self.frame = viewFrame
        
        self.changeOpenStatus?(false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.hideTableView()
    }
    
    // MARK:- tableView dataSource & delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.dropSelectCell.identifier) as! DropSelectCell
        
        let model = self.dataArr[indexPath.row]
        
        cell.setViewWithModel(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! DropSelectCell
        
        self.selectedArr.remove(at: self.currentIndex)
        self.selectedArr.insert(cell.model, at: self.currentIndex)
        
        print(self.selectedArr)
        
        self.selectedClosure?(self.selectedArr)
        
        self.hideTableView()
    }
}

// MARK:-
class DropSelectItemView: UIView {
    
    @IBOutlet weak var itemBtn: UIButton!
    @IBOutlet weak var itemLabel: UILabel!
    var isOpen: Bool = false
    {

        didSet {

            if isOpen == true {
                itemLabel.text = "点击收起↑"
            }
            else {
                itemLabel.text = "点击展开↓"
            }
        }
    }
    
    var index :Int!
    
    var dataArr = Array<DropSelectModel>()

    public var changeIndexClosure: ((_ index: Int, _ isOpen: Bool)->Void)?
    
    // MARK:-
    
    class func addToView(view: UIView, frame: CGRect) -> DropSelectItemView {
        
        let dropSelectItemView = R.nib.dropSelectView.firstView(owner: nil)
        dropSelectItemView?.frame = frame
        
        view.addSubview(dropSelectItemView!)
        
        return dropSelectItemView!
    }
    
    override func awakeFromNib() {
        
        self.isOpen = false
    }
    
    func updateViewWithState(isOpen: Bool) {
        
        self.isOpen = isOpen
    }
    
    @IBAction func openDropClicked(_ sender: Any) {
        
        self.isOpen = !self.isOpen
        
        print("index == ",self.index,"isOpen == ",self.isOpen)
        
        self.changeIndexClosure?(self.index,self.isOpen)
    }
}
