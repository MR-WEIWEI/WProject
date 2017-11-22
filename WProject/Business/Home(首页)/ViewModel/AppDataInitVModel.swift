//
//  AppDataInitViewModel.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/10/25.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
import RxSwift

class AppDataInitVModel: BaseViewModel {
    
    func retrieveCodeList() -> Promise<[RetrieveCodeModel]> {
        
        return Promise(resolvers: { (resolve, reject) in
            
            self.sendRequest(target: AppDataInitAPI.retrieveCodeList)
                .mapModelArray(RetrieveCodeModel.self)
                .subscribe(onNext: {
                    
                    Code.mr_truncateAll()
                    
                    for item in $0 {
                        
                        let code            = Code.mr_createEntity()
                        code?.codeType      = item.codeType
                        code?.codeTypeId    = item.codeTypeId
                        code?.codeTypeName  = item.codeTypeName
                        code?.codeTypeDesc  = item.codeTypeDesc
                        
                        for subItem in item.codeTypeList{
                            
                            let typeItem            = TypeItem.mr_createEntity()
                            typeItem?.codeValue     = subItem.codeValue
                            typeItem?.codeValueDesc = subItem.codeValueDesc
                            typeItem?.code          = code
                        }
                    }
                    
                    saveDataToDB()
                    
                    resolve($0)
                }, onError: {
                    reject($0)
                })
                .disposed(by: self.disposeBag)
            
        })
    }
}
