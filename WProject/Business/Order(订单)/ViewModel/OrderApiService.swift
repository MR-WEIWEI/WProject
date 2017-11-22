//
//  OrderApiService.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/19.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit
import Moya

enum OrderApiService {
    case searchUserInsurances(param: [String: Any])
}

extension OrderApiService: TargetType {
    
    public var path: String {
        switch self {
        case .searchUserInsurances:
            return "gxgjapi/searchUserInsurances.do"
        }
    }
    
    public var task: Task {
        switch self {
            
        case .searchUserInsurances(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        }
    }
    
}

