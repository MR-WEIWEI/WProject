//
//  AppViewModel.swift
//  WProject
//
//  Created by WeiWei on 2017/11/22.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
import RxSwift

class AppViewModel: BaseViewModel {
    
    /// 城市合伙人加载页面
    func requestCityPartnerOnload(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.requestCityPartnerOnload(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 城市合伙人报名
    func requestCityPartner(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.requestCityPartner(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取系统公告
    func retrieveSystemNotice(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.retrieveSystemNotice(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取系统站内信
    func retrieveInnerMessages(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.retrieveInnerMessages(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新用户站内信为已读
    func updateInnerMessageAsRead(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.updateInnerMessageAsRead(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 添加用户反馈信息
    func addUserFeedback(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.addUserFeedback(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 查询用户反馈信息
    func searchUserFeedback(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.searchUserFeedback(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 查询系统提供的投诉类型
    func retrieveComplainType(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.retrieveComplainType(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 添加用户投诉信息
    func addUserComplain(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.addUserComplain(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 查询用户投诉信息
    func searchUserComplainList(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.searchUserComplainList(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取平台信息
    func retrievePlatformInfo(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppApiService.retrievePlatformInfo(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
}
