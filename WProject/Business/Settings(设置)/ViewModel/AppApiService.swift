//
//  AppApiService.swift
//  WProject
//
//  Created by WeiWei on 2017/11/22.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit
import Moya

enum AppApiService {
    
    /// 城市合伙人加载页面
    case requestCityPartnerOnload(param: [String: Any])
    
    /// 城市合伙人报名
    case requestCityPartner(param: [String: Any])
    
    /// 获取系统公告
    case retrieveSystemNotice(param: [String: Any])
    
    /// 获取系统站内信
    case retrieveInnerMessages(param: [String: Any])
    
    /// 更新用户站内信为已读
    case updateInnerMessageAsRead(param: [String: Any])
    
    /// 添加用户反馈信息
    case addUserFeedback(param: [String: Any])
    
    /// 查询用户反馈信息
    case searchUserFeedback(param: [String: Any])
    
    /// 查询系统提供的投诉类型
    case retrieveComplainType(param: [String: Any])
    
    /// 添加用户投诉信息
    case addUserComplain(param: [String: Any])
    
    /// 查询用户投诉信息
    case searchUserComplainList(param: [String: Any])
    
    /// 获取平台信息
    case retrievePlatformInfo(param: [String: Any])
}

extension AppApiService: TargetType {
    
    public var path: String {
        
        switch self {
        case .requestCityPartnerOnload:
            return "gxgjapi/requestCityPartnerOnload.do"
            
        case .requestCityPartner:
            return "gxgjapi/requestCityPartner.do"
            
        case .retrieveSystemNotice:
            return "gxgjapi/retrieveSystemNotice.do"
            
        case .retrieveInnerMessages:
            return "gxgjapi/retrieveInnerMessages.do"
            
        case .updateInnerMessageAsRead:
            return "gxgjapi/updateInnerMessageAsRead.do"
            
        case .addUserFeedback:
            return "gxgjapi/addUserFeedback.do"
            
        case .searchUserFeedback:
            return "gxgjapi/searchUserFeedback.do"
            
        case .retrieveComplainType:
            return "gxgjapi/retrieveComplainType.do"
            
        case .addUserComplain:
            return "gxgjapi/addUserComplain.do"
            
            
        case .searchUserComplainList:
            return "gxgjapi/searchUserComplainList.do"
            
        case .retrievePlatformInfo:
            return "gxgjapi/retrievePlatformInfo.do"
        }
    }
    
    public var task: Task {
        
        switch self {
        case .requestCityPartnerOnload(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        
        case .requestCityPartner(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveSystemNotice(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveInnerMessages(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .updateInnerMessageAsRead(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .addUserFeedback(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .searchUserFeedback(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrieveComplainType(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .addUserComplain(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .searchUserComplainList(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            
        case .retrievePlatformInfo(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        }
    }
}
