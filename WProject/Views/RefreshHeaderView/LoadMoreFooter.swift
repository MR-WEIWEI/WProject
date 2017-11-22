//
//  LoadMoreFooter.swift
//  66FM
//
//  Created by PandaApe on 24/08/2017.
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit
import PullToRefreshKit
import Foundation

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

public enum RefreshKitFooterText{
    case pullToRefresh
    case tapToRefresh
    case scrollAndTapToRefresh
    case refreshing
    case noMoreData
}

public enum RefreshMode{
    /// 只有Scroll才会触发
    case scroll
    /// 只有Tap才会触发
    case tap
    /// Scroll和Tap都会触发
    case scrollAndTap
}

open class LoadMoreFooter: UIView, RefreshableFooter {
    open let spinner:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    open  let textLabel:UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 140,height: 40))    /// 触发刷新的模式
    open var refreshMode = RefreshMode.scrollAndTap{
        didSet{
            tap.isEnabled = (refreshMode != .scroll)
            udpateTextLabelWithMode(refreshMode)
        }
    }
    fileprivate func udpateTextLabelWithMode(_ refreshMode:RefreshMode){
        switch refreshMode {
        case .scroll:
            textLabel.text = textDic[.pullToRefresh]
        case .tap:
            textLabel.text = textDic[.tapToRefresh]
        case .scrollAndTap:
            textLabel.text = textDic[.scrollAndTapToRefresh]
        }
    }
    fileprivate var tap:UITapGestureRecognizer!
    fileprivate var textDic = [RefreshKitFooterText:String]()
    /**
     This function can only be called before Refreshing
     */
    open  func setText(_ text:String,mode:RefreshKitFooterText){
        textDic[mode] = text
        textLabel.text = textDic[.pullToRefresh]
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textLabel.font      = UIFont.systemFont(ofSize: 12)
//        textLabel.textColor = UIColor(hex: 0xC5C5C5)
        textLabel.textAlignment = .center
        
        addSubview(spinner)
        addSubview(textLabel)
        
        textDic[.pullToRefresh]     = "上拉加载更多"
        textDic[.refreshing]        = "加载中..."
        textDic[.noMoreData]        = "没有更多了"
        textDic[.tapToRefresh]      = "上拉加载更多"
        textDic[.scrollAndTapToRefresh] = "上拉加载更多"
        udpateTextLabelWithMode(refreshMode)
        tap = UITapGestureRecognizer(target: self, action: #selector(LoadMoreFooter.catchTap(_:)))
        self.addGestureRecognizer(tap)
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2);
        spinner.center = CGPoint(x: frame.width/2 - 70 - 20, y: frame.size.height/2)
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func catchTap(_ tap:UITapGestureRecognizer){
        let scrollView = self.superview?.superview as? UIScrollView
        scrollView?.beginFooterRefreshing()
    }
    // MARK: - Refreshable  -
    open func heightForRefreshingState() -> CGFloat {
        return 50
    }
    open func didBeginRefreshing() {
        textLabel.text = textDic[.refreshing];
        spinner.startAnimating()
    }
    open func didEndRefreshing() {
        udpateTextLabelWithMode(refreshMode)
        spinner.stopAnimating()
    }
    open func didUpdateToNoMoreData(){
        textLabel.text = textDic[.noMoreData]
    }
    open func didResetToDefault() {
        udpateTextLabelWithMode(refreshMode)
    }
    open func shouldBeginRefreshingWhenScroll()->Bool {
        return refreshMode != .tap
    }
    // MARK: - Handle touch -
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard refreshMode != .scroll else{
            return
        }
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    }
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard refreshMode != .scroll else{
            return
        }
        self.backgroundColor = UIColor.white
    }
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard refreshMode != .scroll else{
            return
        }
        self.backgroundColor = UIColor.white
    }
    
    // MARK: Tintable
    func setThemeColor(themeColor: UIColor) {
        textLabel.textColor = themeColor
        spinner.color = themeColor
    }
}
