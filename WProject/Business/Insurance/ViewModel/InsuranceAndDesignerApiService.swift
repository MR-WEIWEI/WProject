//
//  InsuranceAndDesignerApiService.swift
//  66FM
//
//  Created by WeiWei on 2017/11/20.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit
import Moya

enum InsuranceAndDesignerApiService {
    
    /// 用户单独购买保险 
    case userBuyInsurance(param: [String: Any])
    
    /// 订单中心-查看保险列表
    case searchUserInsurances(param: [String: Any])
    
    /// 获取设计师作品详情信息
    case getDesignProductDetail(param: [String: Any])
    
    /// 根据查询条件查询设计师作品
    case searchDesignProductWithCondition(param: [String: Any])
    
    /// 设计师模块数据初始化
    case getDesignInitData(param: [String: Any])
}

extension InsuranceAndDesignerApiService: TargetType {
    
    public var path: String {
        switch self {
        case .userBuyInsurance:
            return "gxgjapi/userBuyInsurance.do"
        case .searchUserInsurances:
            return "gxgjapi/searchUserInsurances.do"
            
        case .getDesignProductDetail:
            return "gxgjapi/getDesignProductDetail.do"
            
            
        case .searchDesignProductWithCondition:
            return "gxgjapi/searchDesignProductWithCondition.do"
            
            
        case .getDesignInitData:
            return "/gxgjapi/getDesignInitData.do"
            
        }
    }
    
    public var task: Task {
        switch self {
            
        case .userBuyInsurance(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .searchUserInsurances(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getDesignProductDetail(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
            
        case .searchDesignProductWithCondition(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .getDesignInitData(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        }
    }
    
}

