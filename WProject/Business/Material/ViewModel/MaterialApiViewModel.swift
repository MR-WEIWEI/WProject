//
//  MaterialApiViewModel.swift
//  66FM
//
//  Created by WeiWei on 2017/11/20.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
import RxSwift

class MaterialApiViewModel: BaseViewModel {
    
    /// 根据用户名字模糊查询用户
    func searchUserListByUserName(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.searchUserListByUserName(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 查询默认当前地区的所有材料包，根据条件查询时也调用此接口
    func searchPackageByCondition(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.searchPackageByCondition(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 查询材料包所有品牌
    func searchAllPackageBrand(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.searchAllPackageBrand(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 查看单个材料包详情，并且查看单个材料包里包含的材料
    func viewPackageMaterials(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.viewPackageMaterials(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 生成材料包订单
    func generatePackageOrder(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.generatePackageOrder(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 材料包订单站内分享时调用
    func localSharePackageOrder(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.localSharePackageOrder(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 填写收货信息和付款方式后提交订单
    func submitPackageOrder(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.submitPackageOrder(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    
    /// 材料包订单线上支付成功后回调此接口
    func recordPackagePayedSuccess(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.recordPackagePayedSuccess(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 材料包订单-用户确认收货
    func confirmRecievePackage(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.confirmRecievePackage(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    
    /// 材料包订单-添加评价，用户和材料商共用
    func addRemarkForPackageOrder(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.addRemarkForPackageOrder(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 订单中心-查看所有材料包订单
    func searchAllPackageOrders(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.searchAllPackageOrders(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 订单中心-查看单个材料包订单详情
    func viewPackageOrderDetails(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: MaterialApiService.viewPackageOrderDetails(param: param))
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

