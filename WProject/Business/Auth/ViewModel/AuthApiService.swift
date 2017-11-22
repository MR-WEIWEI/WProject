//
//  AuthApiService.swift
//  XianMuShu
//
//  Created by Weiwei on 2017/11/19.
//  Copyright © 2017年 pandaApe. All rights reserved.
//

import UIKit
import Moya

enum AuthApiService {
    case login(param: [String: Any])
    case register(param: [String: Any])
}

extension AuthApiService: TargetType {
    
    public var path: String {
        switch self {
        case .login:
            return "gxgjapi/login.do"
        case .register:
            return "gxgjapi/userRegister.do"
        }
    }
    
    public var task: Task {
        switch self {
            
        case .login(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .register(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        }
    }
    
}

