//
//  RefreshHeader.swift
//  66FM
//
//  Created by PandaApe on 21/08/2017.
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit
import PullToRefreshKit

class RefreshHeader: UIView, RefreshableHeader{
    
    var isHomeFrefresher = false {
        willSet{
            
            if isHomeFrefresher == newValue {
                return
            }
            
            if newValue {
                
//                self.backgroundColor        = UIColor(hex: 0x3a3a3a)
                self.backgroundColor = UIColor(red: 58/255.0, green: 58/255.0, blue: 58/255.0, alpha: 1)
//                self.moneyLayer.contents    = R.image.loading_ic()?.cgImage
                self.headerLabel.textColor  = .white
                self.textLabel.textColor    = .white
            }else{
                self.layer.contents         = nil
                self.backgroundColor        = .clear
//                self.moneyLayer.contents    = R.image.loading_ic_black()?.cgImage
                self.headerLabel.textColor  = UIColor(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1)
                self.textLabel.textColor    = UIColor(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1)
                
            }
        }
        
    }
    
    fileprivate var headerLabel:UILabel!

    fileprivate let circleLayer = CAShapeLayer()
    fileprivate let moneyLayer = CALayer()
    fileprivate let textLabel = UILabel()
    fileprivate let strokeColor = UIColor(red: 135.0/255.0, green: 136.0/255.0, blue: 137.0/255.0, alpha: 1.0)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCircleLayer()
        setUpMoneyLayer()
        self.backgroundColor = .clear
        textLabel.frame = CGRect(x: 0,y: 0,width: 120, height: 40)
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1)
        textLabel.font = UIFont.systemFont(ofSize: 13)
        textLabel.textAlignment = .center
        textLabel.text = "下拉刷新"
        headerLabel = UILabel(frame: CGRect(x: 0, y: 250, width: UIScreen.main.bounds.width, height: 35))
        headerLabel.textColor = UIColor(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1)
//        headerLabel.text = "——  不玩套路的理财  ——"
        headerLabel.font = UIFont.systemFont(ofSize: 13)
        headerLabel.textAlignment = .center
        self.addSubview(headerLabel)
        self.addSubview(textLabel)
        //放置Views和Layer
 
        textLabel.center = CGPoint(x: UIScreen.main.bounds.width/2 + 10, y: frame.height - 30)
        self.circleLayer.position = CGPoint(x: UIScreen.main.bounds.width/2 - 35, y: frame.height - 30)
    }
    
    func setUpMoneyLayer(){
        
        self.moneyLayer.position = CGPoint(x: UIScreen.main.bounds.width/2 - 33, y: frame.height - 30)

        self.moneyLayer.bounds = CGRect(x: 0, y: 0,width: 20, height: 20)
        
//        self.moneyLayer.contents = R.image.loading_ic_black()?.cgImage
        self.moneyLayer.isHidden = true
        self.layer.addSublayer(moneyLayer)
        
    }
    func setUpCircleLayer(){
        let bezierPath = UIBezierPath(arcCenter: CGPoint(x: 20, y: 20),
                                      radius: 8.0,
                                      startAngle:-CGFloat.pi/2,
                                      endAngle: CGFloat.pi/2.0 * 3.0,
                                      clockwise: true)
        self.circleLayer.path = bezierPath.cgPath
        self.circleLayer.strokeColor = UIColor.lightGray.cgColor
        self.circleLayer.fillColor = UIColor.clear.cgColor
        self.circleLayer.strokeStart = 0.0
        self.circleLayer.strokeEnd = 0.0
        self.circleLayer.lineWidth = 1.0
        self.circleLayer.lineCap = kCALineCapRound
        self.circleLayer.bounds = CGRect(x: 0, y: 0,width: 40, height: 40)
//      self.circleLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.layer.addSublayer(self.circleLayer)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - RefreshableHeader -
    func heightForRefreshingState()->CGFloat{
        return 60
    }
    
    func percentUpdateDuringScrolling(_ percent:CGFloat){

        let adjustPercent = max(min(1.0, percent),0.0)
        if adjustPercent  == 1.0{
            textLabel.text = "释放刷新"
        }else{
            
            textLabel.text = "下拉刷新"
        }
        self.circleLayer.strokeEnd = 0.1 + 0.9 * adjustPercent
    }
    
    func didBeginRefreshingState(){
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotateAnimation.fromValue = NSNumber(value: 0)
        rotateAnimation.toValue = NSNumber(value: Double.pi * 2.0)
        rotateAnimation.duration = 0.3
        rotateAnimation.isCumulative = true
        rotateAnimation.repeatCount = .infinity
        self.circleLayer.isHidden = true
        self.moneyLayer.isHidden = false

        self.moneyLayer.add(rotateAnimation, forKey: "rotateY")
        textLabel.text = "刷新中..."
    }
    
    func didBeginEndRefershingAnimation(_ result:RefreshResult){
        transitionWithOutAnimation {
            self.circleLayer.strokeEnd = 0.05
        };
        self.circleLayer.removeAllAnimations()
    }
    func didCompleteEndRefershingAnimation(_ result:RefreshResult){
        
        transitionWithOutAnimation {
            self.circleLayer.strokeEnd = 0.05
        };

        self.moneyLayer.removeAllAnimations()
        self.moneyLayer.isHidden = true
        self.circleLayer.isHidden = false
        textLabel.text = "下拉即可刷新"
    }
    func transitionWithOutAnimation(_ clousre:()->()){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        clousre()
        CATransaction.commit()
    }
}
