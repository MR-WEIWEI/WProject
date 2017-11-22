//
//  UserApiService.swift
//  WProject
//
//  Created by WeiWei on 2017/11/21.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit
import Moya

enum UserApiService {
    
    /// 登录接口
    case login(param: [String: Any])
    
    /// 用户注册接口
    case userRegister(param: [String: Any])
    
    /// 更新设置个人资料 - 支付类型
    case updateUserPayment(param: [String: Any])
    /// 更新用户名
    case updateUserName(param: [String: Any])
    /// 更新用户工作经验年数
    case updateUserExperience(param: [String: Any])
    /// 更新设置用户性别
    case updateUserSex(param: [String: Any])
    /// 更新用户年龄
    case updateUserOld(param: [String: Any])
    /// 更新设置用户出生地
    case updateUserBorn(param: [String: Any])
    /// 更新设置用户居住地址
    case updateUserLive(param: [String: Any])
    /// 更新设置工人报价，只有用户类型即user_type_value为“ut_wk”（工人）才
    case updateUserPrice(param: [String: Any])
    /// 获取用户档期
    case retrieveUserSchedule(param: [String: Any])
    /// 更新用户档期
    case updateUserSchedule(param: [String: Any])
    /// 获取工人类型
    case retrieveWorkType(param: [String: Any])
    /// 更新设置工人类型
    case updateWorkType(param: [String: Any])
    /// 获取各类用户的默认评价标签
    case retrieveDefaultUserMarked(param: [String: Any])
    /// 获取用户收货信息
    case retrieveUserDeliveryAddress(param: [String: Any])
    
    /// 新增用户收货信息
    case addUserDeliveryAddress(param: [String: Any])
    
    /// 设置默认收货地址
    case setUserDefaultReceiveAddress(param: [String: Any])
    
    /// 上传用户实名认证信息
    case uploadUserCertification(param: [String: Any])
    
    /// 获取单个用户详情信息
    case retrieveUserDetailInfo(param: [String: Any])
    
    /// 获取用户实名认证信息
    case retrieveUserCertification(param: [String: Any])
    
    /// 购买年费会员成功后回调此接口
    case recordUserAnnualFee(param: [String: Any])
    
    /// 补交年费成功后回调此接口
    case updateUserAnnualFee(param: [String: Any])
    
    /// 获取会员年费信息
    case retrieveUserAnnualFee(param: [String: Any])
    
    /// 更新设置个人资料 - 用户头像
    case updateUserHeaderFile(param: [String: Any])
    
}

extension UserApiService: TargetType {

    public var path: String {
        switch self {
            
        case .login:
            return "gxgjapi/login.do"
            
        case .userRegister:
            return "gxgjapi/userRegister.do"
            
        case .updateUserPayment:
            return "gxgjapi/updateUserPayment.do"
            
        case .updateUserName:
            return "gxgjapi/updateUserName"
            
        case .updateUserExperience:
            return "gxgjapi/updateUserExperience.do"
            
        case .updateUserSex:
            return "gxgjapi/updateUserSex.do"
            
        case .updateUserOld:
            return "gxgjapi/updateUserOld.do"
            
        case .updateUserBorn:
            return "gxgjapi/updateUserBorn.do"
            
        case .updateUserLive:
            return "gxgjapi/updateUserLive.do"
            
        case .updateUserPrice:
            return "gxgjapi/updateUserPrice.do"
            
        case .retrieveUserSchedule:
            return "gxgjapi/retrieveUserSchedule.do"
            
        case .updateUserSchedule:
            return "gxgjapi/updateUserSchedule.do"
            
        case .retrieveWorkType:
            return "gxgjapi/retrieveWorkType.do"
            
        case .updateWorkType:
            return "gxgjapi/updateWorkType.do"
            
        case .retrieveDefaultUserMarked:
            return "gxgjapi/retrieveDefaultUserMarked.do"
            
        case .retrieveUserDeliveryAddress:
            return "gxgjapi/retrieveUserDeliveryAddress.do"
            
        case .addUserDeliveryAddress:
            return "gxgjapi/addUserDeliveryAddress.do"
            
        case .setUserDefaultReceiveAddress:
            return "gxgjapi/setUserDefaultReceiveAddress.do"
            
        case .uploadUserCertification:
            return "gxgjapi/uploadUserCertification.do"
            
        case .retrieveUserDetailInfo:
            return "gxgjapi/retrieveUserDetailInfo.do"
            
        case .retrieveUserCertification:
            return "gxgjapi/retrieveUserCertification.do"
            
        case .recordUserAnnualFee:
            return "gxgjapi/recordUserAnnualFee.do"
            
        case .updateUserAnnualFee:
            return "gxgjapi/updateUserAnnualFee.do"
            
        case .retrieveUserAnnualFee:
            return "gxgjapi/retrieveUserAnnualFee"
            
        case .updateUserHeaderFile:
            return " gxgjapi/updateUserHeaderFile.do"
            
        }
    }
    
    public var task: Task {
        switch self {
            
        case .login(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .userRegister(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserPayment(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserName(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserExperience(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserSex(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserOld(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserBorn(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserLive(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserPrice(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveUserSchedule(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserSchedule(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveWorkType(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateWorkType(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveDefaultUserMarked(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveUserDeliveryAddress(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .addUserDeliveryAddress(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .setUserDefaultReceiveAddress(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .uploadUserCertification(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveUserDetailInfo(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveUserCertification(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .recordUserAnnualFee(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserAnnualFee(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveUserAnnualFee(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateUserHeaderFile(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        }
    }
}
