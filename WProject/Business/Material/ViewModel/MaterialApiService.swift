//
//  MaterialApiService.swift
//  66FM
//
//  Created by WeiWei on 2017/11/20.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit
import Moya

enum MaterialApiService {
    
    /// 根据用户名字模糊查询用户
    case searchUserListByUserName(param: [String: Any])
    
    /// 查询默认当前地区的所有材料包，根据条件查询时也调用此接口
    case searchPackageByCondition(param: [String: Any])
    
    /// 查询材料包所有品牌
    case searchAllPackageBrand(param: [String: Any])
    
    /// 查看单个材料包详情，并且查看单个材料包里包含的材料
    case viewPackageMaterials(param: [String: Any])
    
    /// 生成材料包订单
    case generatePackageOrder(param: [String: Any])
    
    /// 材料包订单站内分享时调用
    case localSharePackageOrder(param: [String: Any])
    
    /// 填写收货信息和付款方式后提交订单
    case submitPackageOrder(param: [String: Any])
    
    /// 材料包订单线上支付成功后回调此接口
    case recordPackagePayedSuccess(param: [String: Any])
    
    /// 材料包订单-用户确认收货
    case confirmRecievePackage(param: [String: Any])
    
    /// 材料包订单-添加评价，用户和材料商共用
    case addRemarkForPackageOrder(param: [String: Any])
    
    /// 订单中心-查看所有材料包订单
    case searchAllPackageOrders(param: [String: Any])
    
    /// 订单中心-查看单个材料包订单详情
    case viewPackageOrderDetails(param: [String: Any])
}

extension MaterialApiService: TargetType {
    
    public var path: String {
        switch self {
        case .searchUserListByUserName:
            return "gxgjapi/searchUserListByUserName"
            
        case .searchPackageByCondition:
            return "gxgjapi/searchPackageByCondition.do"
            
        case .searchAllPackageBrand:
            return "gxgjapi/searchAllPackageBrand.do"
            
        case .viewPackageMaterials:
            return "gxgjapi/viewPackageMaterials.do"
            
        case .generatePackageOrder:
            return "gxgjapi/generatePackageOrder.do"
            
        case .localSharePackageOrder:
            return "gxgjapi/localSharePackageOrder.do"
            
        case .submitPackageOrder:
            return "gxgjapi/submitPackageOrder.do"
            
        case .recordPackagePayedSuccess:
            return "gxgjapi/recordPackagePayedSuccess.do"
            
        case .confirmRecievePackage:
            return "gxgjapi/confirmRecievePackage.do"
            
        case .addRemarkForPackageOrder:
            return "gxgjapi/addRemarkForPackageOrder.do"
            
        case .searchAllPackageOrders:
            return "gxgjapi/searchAllPackageOrders.do"
            
        case .viewPackageOrderDetails:
            return "gxgjapi/viewPackageOrderDetails.do"
        }
    }
    
    public var task: Task {
        switch self {
            
        case .searchUserListByUserName(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .searchPackageByCondition(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .searchAllPackageBrand(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .viewPackageMaterials(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .generatePackageOrder(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .localSharePackageOrder(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .submitPackageOrder(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .recordPackagePayedSuccess(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .confirmRecievePackage(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .addRemarkForPackageOrder(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .searchAllPackageOrders(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .viewPackageOrderDetails(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        }
    }
    
}

