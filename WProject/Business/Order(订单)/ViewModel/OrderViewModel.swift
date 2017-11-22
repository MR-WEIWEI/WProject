//
//  OrderViewModel.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/19.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
import RxSwift

class OrderViewModel: BaseViewModel {
    
    func searchUserInsurances(param: [String: Any]) -> Promise<[ProjectOrderModel]> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: OrderApiService.searchUserInsurances(param: param))
                .mapModelArray(ProjectOrderModel.self)
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

