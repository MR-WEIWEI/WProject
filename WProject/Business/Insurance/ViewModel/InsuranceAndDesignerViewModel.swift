//
//  InsuranceAndDesignerViewModel.swift
//  66FM
//
//  Created by WeiWei on 2017/11/20.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
import RxSwift

class InsuranceAndDesignerViewModel: BaseViewModel {
    
    /// 用户单独购买保险
    func userBuyInsurance(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: InsuranceAndDesignerApiService.userBuyInsurance(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 订单中心-查看保险列表
    func searchUserInsurances(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: InsuranceAndDesignerApiService.searchUserInsurances(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取设计师作品详情信息
    func getDesignProductDetail(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: InsuranceAndDesignerApiService.getDesignProductDetail(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 根据查询条件查询设计师作品
    func searchDesignProductWithCondition(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: InsuranceAndDesignerApiService.searchDesignProductWithCondition(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 设计师模块数据初始化
    func getDesignInitData(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: InsuranceAndDesignerApiService.getDesignInitData(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
}
