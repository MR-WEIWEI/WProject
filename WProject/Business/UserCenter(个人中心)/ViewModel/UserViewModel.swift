//
//  UserViewModel.swift
//  WProject
//
//  Created by WeiWei on 2017/11/21.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
import RxSwift

class UserViewModel: BaseViewModel {
    
    /// 登录接口
    func login(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.login(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 用户注册接口
    func userRegister(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.userRegister(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新设置个人资料 - 支付类型
    func updateUserPayment(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserPayment(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新用户名
    func updateUserName(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserName(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新用户工作经验年数
    func updateUserExperience(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserExperience(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新设置用户性别
    func updateUserSex(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserSex(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新用户年龄
    func updateUserOld(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserOld(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新设置用户出生地
    func updateUserBorn(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserBorn(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新设置用户居住地址
    func updateUserLive(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserLive(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新设置工人报价，只有用户类型即user_type_value为“ut_wk”（工人）才
    func updateUserPrice(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserPrice(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取用户档期
    func retrieveUserSchedule(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.retrieveUserSchedule(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新用户档期
    func updateUserSchedule(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserSchedule(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取工人类型
    func retrieveWorkType(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.retrieveWorkType(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新设置工人类型
    func updateWorkType(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateWorkType(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取各类用户的默认评价标签
    func retrieveDefaultUserMarked(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.retrieveDefaultUserMarked(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取用户收货信息
    func retrieveUserDeliveryAddress(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.retrieveUserDeliveryAddress(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 新增用户收货信息
    func addUserDeliveryAddress(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.addUserDeliveryAddress(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 设置默认收货地址
    func setUserDefaultReceiveAddress(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.setUserDefaultReceiveAddress(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 上传用户实名认证信息
    func uploadUserCertification(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.uploadUserCertification(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取单个用户详情信息
    func retrieveUserDetailInfo(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.retrieveUserDetailInfo(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取用户实名认证信息
    func retrieveUserCertification(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.retrieveUserCertification(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 购买年费会员成功后回调此接口
    func recordUserAnnualFee(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.recordUserAnnualFee(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 补交年费成功后回调此接口
    func updateUserAnnualFee(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserAnnualFee(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 获取会员年费信息
    func retrieveUserAnnualFee(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.retrieveUserAnnualFee(param: param))
                .mapModelObject(BaseBean.self)
                .subscribe(onNext: {
                     
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    /// 更新设置个人资料 - 用户头像
    func updateUserHeaderFile(param: [String: Any]) -> Promise<BaseBean> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: UserApiService.updateUserHeaderFile(param: param))
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

