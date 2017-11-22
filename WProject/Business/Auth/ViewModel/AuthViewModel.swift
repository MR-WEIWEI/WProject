//
//  AuthViewModel.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/19.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
import RxSwift

class AuthViewModel: BaseViewModel {
    
    func login(param: [String: Any]) -> Promise<UserInfoModel> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AuthApiService.login(param: param))
                .mapModelObject(UserInfoModel.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
    
    func register(param: [String: Any]) -> Promise<UserInfoModel> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AuthApiService.register(param: param))
                .mapModelObject(UserInfoModel.self)
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
